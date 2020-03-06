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

      def create
       @list = List.new(name: params[:name], user_id: params[:user_id])
        if @list.save 
          render json: @list, include: [:leads]
        else 
          render json: {errors: @list.errors.full_messages}
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

      # def show_special
      #   p "********SHOW SPECIAL***** "
      #   p params
      #   @list = List.find(params[:list_id])
      #   if @list
      #     new_list = []
      #     # @list.each do | list | 
      #       @list.leads.each do |lead|
      #         lead.leadnotes.each do |leadnote|
      #           leadnote_array = []
      #           if leadnote.user_id == params[:user_id]
      #             leadnote_array.push(leadnote)
      #           end
      #         lead_with_notes = {:lead => lead}
      #         # lead_with_notes[:leadnotes] = lead.leadnotes
      #         lead_with_notes[:leadnotes] = leadnote_array
      #         new_list.push(lead_with_notes)
      #         # binding.pry
      #         end
      #       end
      #     render json: {list: @list, leads: new_list}
      #   else 
      #     render json: {errors: "No list found with that user id"}
      #   end
      # end

      def show_special
        p "********SHOW SPECIAL***** "
        p params
        @list = List.find(params[:id])
        if @list
          new_list = []
          # @list.each do | list | 
            @list.leads.each do |lead|
              leadnote_array = []
              lead.leadnotes.each do |leadnote|
                if leadnote.user_id == params[:user_id]
                  leadnote_array.push(leadnote)
                end
              end
              lead_with_notes = {:lead => lead}
              lead_with_notes[:leadnotes] = leadnote_array
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
        if list.destroy 
          render json: list
        else 
          render json: {errors: list.errors.full_messages}
        end
      end


    end 
 end
end






# def show_special_all
#   @lists = List.where(user_id: params[:id])
#   if @lists
#     # binding.pry
#     new_list = []
    
#     @lists.each do |list| 
#       list.leads.each do |lead|
#         lead.leadnotes.each do |leadnote|
#           leadnote_array = []
#           if leadnote.user_id == params[:id]
#             leadnote_array.push(leadnote)
#           end
#         end
#           p "SHOW SPECIAL ALL ********************************"
        
#           lead_with_notes = {:lead => lead}
#           lead_with_notes[:list_id] = list.id
#           lead_with_notes[:leadnotes] = leadnote_array
#           new_list.push(lead_with_notes)
#         end
#       end
#     # p leadnotes
#     render json: {leads_with_notes: new_list}
#   else 
#     render json: {errors: "No list found with that id"}
#   end
# end
