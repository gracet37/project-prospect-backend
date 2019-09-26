# require_relative "./yelp_controller.rb" 

# ? USER STORY
# A user can see a list of all their lists - INDEX 
# A user can delete a list
# A user can create a list 

module Api
  module V1
    class ListsController < ApplicationController

      def index 
        list = List.all 
        render json: list, include: [:leads]
      end

      # def create
      #   p "lists ****************************"
      #   p params
      #   @list = List.where(name: params[:name], user_id: user_id).first_or_create
      #   if @list 
      #     render json: @list, include: [:leads]
      #   else 
      #     render json: {errors: @list.errors.full_messages}
      #   end
      # end

      def create
        p "*************** LIST CREATE **************" 
        # p current_user
        # token = request.headers[:Authorization].split(' ')[1]
        # p token
        # decoded_token = JWT.decode(token, 'app_secret', true, { algorithm: 'HS256' })
    
        # id = decoded_token.first['id']
        # p id
        p params
        # user = User.find(id)
       list = List.new(name: params[:name], user_id: params[:user_id])
        if list.save 
          render json: list, include: [:leads]
        else 
          render json: {errors: list.errors.full_messages}
        end
      end

      def show 
        # if logged_in? 
        # # p " auth header"
        # # p auth_header
        # # token = params[:token]
        # # p "** token **"
        # # p token
        @list = List.where(user_id: params[:id])
        if @list
          render json: @list, include: [:leads]
        else 
          render json: {errors: "No list found with that user id"}
        end
      end

      def show_by_id
        @list = List.find(params[:id])
        if @list
          render json: @list, include: [:leads]
        else 
          render json: {errors: "No list found with that id"}
        end
      end

      def destroy 
        p "******************** DELETE LIST ********************"
        p params
        list = List.find_by(id: params[:id])
        list.destroy 
        render json: {list: list, message: "list deleted"}
      end
    end 
 end
end