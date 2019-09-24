class ApplicationController < ActionController::API

  def issue_token(user)
    JWT.encode({user_id: user.id}, ENV['secret_key'], 'HS256')
  end

  def current_user
    @user ||= User.find_by(id: user_id)
  end

  def token
    request.headers['Authorization']
  end

  def decoded_token
    begin
      # [{user_id: 1}, {algo: 'hs256'}]
      JWT.decode(token, ENV['secret_key'], true, { :algorithm => 'HS256' })
    rescue JWT::DecodeError
      [{}]
    end
  end

  def user_id
    decoded_token.first['user_id']
  end

  def logged_in?
    !!current_user
  end
end



# class ApplicationController < ActionController::API
#   # before_action :authorized

#   def encode_token(payload)
#     JWT.encode(payload, 'philz_greece')
#   end 

#   def decoded_token
#     # p auth_header
#     if auth_header
#       token = auth_header.split(' ')[1]
#       begin
#         JWT.decode(token, 'philz_greece', true, algorithm: 'HS256')
#       rescue JWT::DecodeError
#         nil 
#       end
#     end
#   end

#   def custom_decode(token)
#     begin
#       JWT.decode(token, 'philz_greece', true, algorithm: 'HS256')
#     rescue JWT::DecodeError
#       p "Decode Error Bruh"
#       nil
#     end
#   end

#   def auth_header
#     request.headers['Authorization']
#   end

#   def current_user 
#     if decoded_token
#       user_id = decoded_token[0]['user_id']
#       @user = User.find_by(id: user_id)
#     end
#   end

#   def logged_in? 
#     # p current_user
#     !!current_user
#   end

#   def authorized
#     render json: {message: 'Please log in'}, status: :unauthorized unless logged_in?
#   end

# end
