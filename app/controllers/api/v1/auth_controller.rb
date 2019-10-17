class Api::V1::AuthController < ApplicationController


# CREATE NEW USER

def create
    p '========================================'

    user = User.new(first_name: params[:auth][:firstName], last_name: params[:auth][:lastName], email: params[:auth][:email], password: params[:auth][:password])
    p user
    if user.save
      token = JWT.encode({id: user.id}, 'app_secret', 'HS256')
      # render json: { id: user.id, first_name: user.first_name, last_name: user.last_name, email: user.email, token: token}
            render json: { user: user, token: token}
    else
      render json: {error: user.errors.full_messages}
    end
end

# LOGIN USER

def login 
    p "******LOGIN********"
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = JWT.encode({id: @user.id}, 'app_secret', 'HS256')
      render json: {user: @user, token: token}, status: :accepted
    else 
      render json: {message: 'Invalid username or password'}, status: :unauthorized
    end

end 

# CHECK IF USER LOGGED IN AND GET CURRENT USER DATA

  def show
    p "******************CURRENT USER *******************"
    p current_user
    token = request.headers[:Authorization].split(' ')[1]
    p token
    decoded_token = JWT.decode(token, 'app_secret', true, { algorithm: 'HS256' })

    id = decoded_token.first['id']
    p id
    user = User.find(id)
    if user
      render json: { user: user, token: token }
    else
      render json: { error: 'Not Authorized'}, status: 401
    end
  end
end






























# module Api
#   module V1   
#     class AuthController < ApplicationController

#       # Create a new user 
#       def create
#         p '=========================================='
#         user = User.new(first_name: params[:auth][:firstName], last_name: params[:auth][:lastName], email: params[:auth][:email], password: params[:auth][:password])
#         p user
#         if user.save
#           token = encode_token(user_id: @user.id)
#           render json: { user: user, token: token}, status: :created
#         else
#           render json: { error: 'Not Authorized'}, status: 401
#         end
#       end
# # // USER LOGIN
#       def login
#         p "******LOGIN********"
#         p params
#         user = User.find_by(email: params[:email])
#         if user && user.authenticate(params[:password])
#           token = encode_token(user)
#           render json: {user: user, token: token}, status: :accepted
#           # render json: { message: 'lol' }
#         else 
#           render json: {error: 'Invalid username or password'}, status: :unauthorized
#         end
#       end

#       def show
#         p '************SHOW SHIZ'
#         # p " auth header"
#         # p auth_header
#         token = params[:auth][:token]
#         # p token
#         decoded_id = custom_decode(token)[0]["user_id"]
#         # p "decoded id"
#         # p decoded_id
#         # p token
#         if decoded_id
#           user = User.find_by(id: decoded_id)
#           render json: {user: user}
#         else
#           render json: {error: 'Invalid Token'}
#         end
#         # token = request.headers[:Authorization].split(' ')[1]
#         # p token
#         # decoded_token = JWT.decode(token, 'app_secret', true, { algorithm: 'HS256' })

#         # id = decoded_token.first['id']
#         # user = User.find(id)
#         # if user
#         #   render json: { id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name, token: token }
#         # else
#         #   render json: { error: 'Not Authorized'}, status: 401
#         # end
#       end

#       # skip_before_action :authorized, only: [:create]

#       # # User will login with email and password
#       # def create
#       #   @user = User.find_by(email: params[:email])
#       #   if @user && @user.authenticate(params[:password])
#       #     token = encode_token({user_id: @user.id})
#       #     render json: {user: @user, jwt: token}, status: :accepted
#       #   else 
#       #     render json: {message: 'Invalid username or password'}, status: :unauthorized
#       #   end
#       # end

#       # def finduser
#       #   token = params[:token]
#       #   # p token
#       #   decoded_id = custom_decode(token)[0]["user_id"]
#       #   # p decoded_id
#       #   if decoded_id
#       #     user = User.find_by(id: decoded_id)
#       #     render json: {user: user}, status: :accepted
#       #   else
#       #     render json: {message: 'Invalid Token'}, status: :unauthorized
#       #   end

#       # private

#       # def user_login_params
#       #   params.require(:user).permit(:username, :password)
#       # end
#     end
#   end
# end
