module Api
  module V1

    class LeadlistsController < ApplicationController
      
      def index
        @leadlists = Leadlist.all
        render json: @leadlists
      end

      def create 
        @leadlist = Leadlist.where(list_id: params[:list_id], lead_id: params[:lead_id]).first_or_create
        if @leadlist
          render json: @leadlist
        else 
          render json: {errors: @leadlist.errors.full_messages}
        end
      end

      def show 
        @list = List.find(params[:id])
        if @list
          render json: @list, include: [:leads]
        else 
          render json: {errors: "No list found with that id"}
        end
      end

      def destroy 
        p "******************** DELETE LISTLEAD ********************"
        p params
        lead = Leadlist.find_by(list_id: params[:list_id], lead_id: params[:lead_id])
        lead.destroy 
        render json: {lead: lead, message: "lead deleted"}
      end

      private 

      def find_leadlist

      end

    end 
  end
end
