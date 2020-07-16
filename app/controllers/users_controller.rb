class UsersController < ApplicationController
  # I dont think this is required since the login assigns a user
  before_action :set_user, only: [:log_in, :show, :update, :destroy]
  
  # authorized comes from ApplicationController 
  skip_before_action :authorized#, only: [:log_in, :create]
 
  def log_in
    user = User.find_by_email(user_login_params[:email])
    #User#authenticate comes from BCrypt
    if user && user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), jwt: token}, status: :accepted
    else
      render json: {message: 'Invalid username or password'}, status: :unauthorized
    end
  end

  def index
    users = User.all
    render json: {users: users.each{|user| UserSerializer.new(user)}}, status: :ok
  end

  def show
    render json: {user: UserSerializer.new(@user)}, status: :created
  end

  def create
    user = User.create(user_params)
    if user.vaild?
      render json: {user: UserSerializer.new(user)}, status: :created
    else
      render_errors
    end
  end

  def update
    user.update(user_params)
    if user.valid?
      render json: {user: UserSerializer.new(user)}, status: :accepted
    else
      render_errors
    end
  end

  def destroy
    user.destroy
    render json: {status: :no_content}
  end

  private
  # I dont think this is required since the login assigns a user
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :email_confirmation, :password, :password_confirmation, :first_name, :middle_name, :last_name, :street, :city, :state, :postal_code, :country, :about)
  end

  # Only allow a list of trusted parameters through, limit that set further for login
  def user_login_params
    params.require(:user).permit(:email, :password)
  end

  # Render error messages if create/update fail
  def render_errors
    render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
  end

end
