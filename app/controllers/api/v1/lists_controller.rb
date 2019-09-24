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
        render json: list
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
        p current_user
        # p params 
        p logged_in?
       list = List.new(name: params[:name], user_id: params[:user_id])
        if list.save 
          render json: list
        else 
          render json: {errors: list.errors.full_messages}
        end
      end

      def show 
        if logged_in? 
        # p " auth header"
        # p auth_header
        # token = params[:token]
        # p "** token **"
        # p token
          @list = List.find_by(user_id: current_user.id)
          render json: @list, include: [:leads]
        else 
          render json: {errors: "No list found with that user id"}
        end
      end

      def destroy 
        @list = List.find_by(id: params[:id])
        @list.destroy 
        render json: {message: "list deleted"}
      end
    end 
 end
end