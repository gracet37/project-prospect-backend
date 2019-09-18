class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  # def index
  #     @users = User.all
  #     render json: @users#, include: [:teams]
  # end
  
  # def create   
  #     p "################"
  #     @user = User.new(username: params[:username], password: params[:password], img_url: params[:img_url], title: params[:title])
  #     if @user.save
  #         @token = encode_token(user_id: @user.id)
  #         render json: {user: @user, jwt: @token}, status: :created
  #     else
  #         render json: {errors: @user.errors.full_messages}, status: :not_acceptable
  #     end
  # end
  
  # private

  # def user_params
  #     params.require(:user).permit(:username, :password, :password_digest, :img_url, :title)
  # end

end