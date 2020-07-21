class ApplicationController < ActionController::API
  # Enable cookies
  include ::ActionController::Cookies

  # Note this applies to all controllers that inherit from ApplicationController
  before_action :authorized
  
  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end
  
  def jwt_cookie
    cookies.signed[:jwt]
  end
  
  def decoded_token
    if jwt_cookie
      begin
        JWT.decode(jwt_cookie, 'my_s3cr3t', true, algorithm: 'HS256')
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
    puts "Inside authorized"
    puts cookies.signed[:jwt]
    puts logged_in?
    render json: {errors: ['Please log in']}, status: :unauthorized unless logged_in?
  end
end
