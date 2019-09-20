# require_relative "./yelp_controller.rb" 
module Api
  module V1
    class LeadsController < ApplicationController

      def index 
        leads = Lead.all 
        render json: leads
      end

      def create   
        @lead = Lead.new(
            confidence_score: params[:confidence],
            first_name: params[:first_name],
            last_name: params[:last_name],
            linkedin: params[:linkedin],
            phone_number: params[:phone_number],
            position: params[:position],
            email: params[:value],
            website: params[:website]
            )
        if @lead.save
            render json: @lead
        else
            render json: {errors: @lead.errors.full_messages}
        end
      end

  # def show 

  # end

  # def destroy
  #   @lead = Lead.find(params[:lead_id])
  #   @lead.delete
  #   render json: {message: "lead deleted"}
  # end

  #  YELP API SEARCH FOR COMPANIES
  # def search
  #   query_category = params[:categories]
  #   query_location = params[:location]
  #   p query_location
  #   p query_category
  #   results = YelpApiAdapter.search(query_category, query_location)
  #   render json: {message: 'YELP API', results: results}
  # end

    end 
  end
end
