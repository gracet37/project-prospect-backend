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

      def create
        @list = List.where(name: params[:name], user_id: current_user.id).first_or_create
        if @list 
          render json: @list, include: [:leads]
        else 
          render json: {errors: @list.errors.full_messages}
        end
      end

      def show 
        if logged_in? 
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