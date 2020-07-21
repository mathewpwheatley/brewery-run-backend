class UsersController < ApplicationController

  # authorized comes from ApplicationController 
  skip_before_action :authorized, only: [:index, :log_in, :create]
 
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

  def log_out
    cookies.delete(:jwt)
    render json: {message: ["JWT HTTP Only Cookie Deleted, User Logged Out"]}, status: :no_content

  end

  def index
    users = User.all
    render json: users, each_serializer: UserSerializerIndex, status: :ok
  end

  def show
    user = active_user
    if user.id == params[:id].to_i
      render json: user, serializer: UserSerializerActive, status: :ok
    else
      user = User.find(params[:id])
      render json: user, serializer: UserSerializerPublic, status: :ok
    end
  end

  def create
    user = User.create(user_params)
    if user.valid?
      log_in_response(user)
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  # def update
  #   @user.update(user_params)
  #   if @user.valid?
  #     render json: @user, serializer: User::UserSerializerActive, status: :accepted
  #   else
  #     render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @user.destroy
  #   render status: :no_content
  # end

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
    cookies.signed[:jwt] = {value: token, http_only: true, expires: 2.hour.from_now}
    # Render json (with cookies)
    render json: user, serializer: LogInSerializer, status: :accepted
  end

end