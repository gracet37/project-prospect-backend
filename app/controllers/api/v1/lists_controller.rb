# require_relative "./yelp_controller.rb" 
require 'pry'

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
        # p current_user
        # token = request.headers[:Authorization].split(' ')[1]
        # p token
        # decoded_token = JWT.decode(token, 'app_secret', true, { algorithm: 'HS256' })
    
        # id = decoded_token.first['id']
        # p id
        p params
        # user = User.find(id)
       @list = List.new(name: params[:name], user_id: params[:user_id])
        if @list.save 
          render json: @list
        else 
          render json: {errors: list.errors.full_messages}
        end
      end

      def show_lists
        p "************SHOW LIST ****************"
        @lists = List.where(user_id: params[:id])
        if @lists
          render json: @lists, include: [:leads]
        else 
          render json: {errors: "No list found with that user id"}
        end
      end

      def show_special
        @list = List.find(params[:id])
        if @list
          new_list = []
          # @list.each do | list | 
            @list.leads.each do |lead|
              lead_with_notes = {:lead => lead}
              lead_with_notes[:leadnotes] = lead.leadnotes
              new_list.push(lead_with_notes)
            end
          render json: {list: @list, leads: new_list}
        else 
          render json: {errors: "No list found with that user id"}
        end
      end

      def show_special_all
        @lists = List.where(user_id: params[:id])
        if @lists
          # binding.pry
          new_list = []
          @lists.each do |list| 
            list.leads.each do |lead|
              lead_with_notes = {:lead => lead}
              lead_with_notes[:list_id] = list.id
              lead_with_notes[:leadnotes] = lead.leadnotes
              new_list.push(lead_with_notes)
            end
          end
          render json: {leads_with_notes: new_list}
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