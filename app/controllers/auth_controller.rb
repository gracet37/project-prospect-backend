class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  # User will login with email and password
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, jwt: token}, status: :accepted
    else 
      render json: {message: 'Invalid username or password'}, status: :unauthorized
    end
  end

  def finduser
    token = params[:token]
    # p token
    decoded_id = custom_decode(token)[0]["user_id"]
    # p decoded_id
    if decoded_id
      user = User.find_by(id: decoded_id)
      render json: {user: user}, status: :accepted
    else
      render json: {message: 'Invalid Token'}, status: :unauthorized
    end
    
  end

  # private

  # def user_login_params
  #   params.require(:user).permit(:username, :password)
  # end
end
