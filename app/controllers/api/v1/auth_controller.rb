module Api
  module V1   
    class AuthController < ApplicationController

      # Create a new user 
      def create
        p '=========================================='
        user = User.new(first_name: params[:auth][:firstName], last_name: params[:auth][:lastName], email: params[:auth][:email], password: params[:auth][:password])
        p user
        if user.save
          token = JWT.encode({id: user.id}, 'app_secret', 'HS256')
          render json: { id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name, token: token}
        else
          render json: { error: 'Not Authorized'}, status: 401
        end
      end

      def login
        p "**************"
        p params
        @user = User.find_by(email: params[:auth][:email])
        if @user && @user.authenticate(params[:auth][:password])
          token = JWT.encode({id: @user.id}, 'app_secret', 'HS256')
          render json: {id: @user.id, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, token: token}
        else 
          render json: {error: 'Invalid username or password'}
        end
      end

      def show
        token = request.headers[:Authorization].split(' ')[1]
        p token
        decoded_token = JWT.decode(token, 'app_secret', true, { algorithm: 'HS256' })

        id = decoded_token.first['id']
        user = User.find(id)
        if user
          render json: { id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name, token: token }
        else
          render json: { error: 'Not Authorized'}, status: 401
        end
      end

      # skip_before_action :authorized, only: [:create]

      # # User will login with email and password
      # def create
      #   @user = User.find_by(email: params[:email])
      #   if @user && @user.authenticate(params[:password])
      #     token = encode_token({user_id: @user.id})
      #     render json: {user: @user, jwt: token}, status: :accepted
      #   else 
      #     render json: {message: 'Invalid username or password'}, status: :unauthorized
      #   end
      # end

      # def finduser
      #   token = params[:token]
      #   # p token
      #   decoded_id = custom_decode(token)[0]["user_id"]
      #   # p decoded_id
      #   if decoded_id
      #     user = User.find_by(id: decoded_id)
      #     render json: {user: user}, status: :accepted
      #   else
      #     render json: {message: 'Invalid Token'}, status: :unauthorized
      #   end

      # private

      # def user_login_params
      #   params.require(:user).permit(:username, :password)
      # end
    end
  end
end
