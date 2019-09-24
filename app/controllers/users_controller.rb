class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  # def index 
  #   users = User.all 
  #   render json :users
  # end

  # def create   
  #   @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  #   if @user.save
  #       @token = encode_token(user_id: @user.id)
  #       render json: {user: @user, jwt: @token}, status: :created
  #   else
  #       render json: {errors: @user.errors.full_messages}, status: :not_acceptable
  #   end
  # end

  def show 
    find_user
    render json: @user, include: [:lists]
  end
  
  def update 
    find_user
      if @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
        render json: @user, include: [:lists]
      else 
        render json: {errors: @user.errors.full_messages}
      end 
  end

  def destroy 
    find_user
    @user.destroy 
    render json: {message: "user deleted"}
  end
  
  private

  def find_user 
    @user = User.find(17)
  end

  # def user_params
  #     params.require(:user).permit(:username, :password, :password_digest, :img_url, :title)
  # end

end