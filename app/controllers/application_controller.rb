class ApplicationController < ActionController::API
  # Enable cookies
  include ::ActionController::Cookies

  # Note this applies to all controllers that inherit from ApplicationController
  before_action :authorized, :set_active_user

  def set_active_user
    User.current = active_user
  end
  
  def encode_token(payload)
    secret = Rails.application.credentials[:jwt_secret]
    JWT.encode(payload, secret)
  end
  
  def jwt_cookie
    cookies.signed[:jwt]
  end
  
  def decoded_token
    if jwt_cookie
      begin
        secret = Rails.application.credentials[:jwt_secret]
        JWT.decode(jwt_cookie, secret, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
  
  def active_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      user = User.find_by(id: user_id)
    end
  end
  
  def logged_in?
    !!active_user
  end
  
  def authorized
    # Right now this only check that you are logged in therefore another user could delete information from another user
    render json: {errors: ['Please log in']}, status: :unauthorized unless logged_in?
  end
end
