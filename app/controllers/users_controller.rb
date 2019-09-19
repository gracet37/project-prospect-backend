class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  # def index
  #     @users = User.all
  #     render json: @users#, include: [:teams]
  # end
  
  def create   
      @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
      if @user.save
          @token = encode_token(user_id: @user.id)
          render json: {user: @user, jwt: @token}, status: :created
      else
          render json: {errors: @user.errors.full_messages}, status: :not_acceptable
      end
  end
  
  # private

  # def user_params
  #     params.require(:user).permit(:username, :password, :password_digest, :img_url, :title)
  # end

end