class UsersController < ApplicationController
  # authorized comes from ApplicationController 
  skip_before_action :authorized, only: [:create, :log_in, :auto_log_in]
 
  def log_in
    user = User.find_by_email(user_login_params[:email])
    if !user
      render json: {errors: ['Invalid email']}, status: :unauthorized
    else
      #User.authenticate comes from BCrypt
      if user.authenticate(user_login_params[:password])
        log_in_response(user)
      else
        render json: {errors: ['Invalid password']}, status: :unauthorized
      end
    end
  end

  def auto_log_in
    if logged_in?
      log_in_response(active_user)
    else
      render json: {messages: ["User not found therefore auto log-in was not completed"]}, status: :ok
    end
  end

  def log_out
    cookies.signed.delete(:jwt)
    render json: {messages: ["JWT HTTP only cookie deleted, user has been logged out"]}, status: :ok

  end

  def index
    users = User.all
    render json: users, each_serializer: UserSerializerIndex, status: :ok
  end

  def show
    user = active_user
    # Check if user is requesting information for themselves
    if user.id == params[:id].to_i
      render json: user, serializer: UserSerializerActive, status: :ok
    else
      user = User.find(params[:id])
      render json: user, serializer: UserSerializer, status: :ok
    end
  end

  def create
    user = User.create(user_params)
    if user.valid?
      # Valid new user, create welcome notification
      user.new_user_notification
      # Log-in new user
      log_in_response(user)
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def edit
    user = active_user
    # Check if user is requesting information for themselves
    if user.id == params[:id].to_i
      render json: user, serializer: UserSerializerEdit, status: :ok
    else
      render json: {messages: ["User can only edit their own account"]}, status: :unauthorized
    end
  end

  def update
    user = active_user
    # Check if user is requesting information for themselves
    if user.id == params[:id].to_i
      user.update(user_params)
      if user.valid?
        render json: user, serializer: UserSerializerActive, status: :accepted
      else
        render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {messages: ["User can only edit their own account"]}, status: :unauthorized
    end
  end

  def destroy
    user = active_user
    # Check if user is requesting information for themselves
    if user.id == params[:id].to_i
      user.destroy
      cookies.signed.delete(:jwt) # This logs the user out on the frontend
      render json: {messages: ['User account has been delete']}, status: :ok
    else
      render json: {messages: ["User can only edit their own account"]}, status: :unauthorized
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :middle_name, :last_name, :street, :city, :state, :postal_code, :country, :about)
  end

  # Only allow a list of trusted parameters through, limit that set further for login
  def user_login_params
    params.require(:user).permit(:email, :password)
  end

  def log_in_response(user)
    # encode token comes from ApplicationController
    token = encode_token({user_id: user.id})
    # Create cookie which is sent with request automatically
    cookies.signed[:jwt] = {value: token, http_only: true, expires: 2.hour.from_now, same_site: :none, secure: true}
    # Render json (with cookies)
    render json: user, serializer: UserSerializerLogIn, status: :accepted
  end

end