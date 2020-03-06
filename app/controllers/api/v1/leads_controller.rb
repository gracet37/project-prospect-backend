# require_relative "./yelp_controller.rb" 
module Api
  module V1
    class LeadsController < ApplicationController

      def index 
        leads = Lead.all 
        render json: leads
      end

      def create 
        p "******************* CREATE LEADS ********************"
        # p params 
        p params
        p params[:selected]
        p "leads array 0 value (FIRST USER EMAIL ADDRESS)"
        p params[:selected][0]
        p "lead company (COMPANY NAME)"
        p params[:company]
        p "lead website (WEBSITE)"
        p params[:website]
        data = params[:selected]
        lead_array = []
        data.each { |lead| 
            new_lead = Lead.find_or_create_by(first_name: lead[:name], last_name: lead[:last_name], email: lead[:email], position: lead[:position], confidence_score: lead[:confidence], company: params[:company], website: params[:website])
            lead_array.push(new_lead)
        }
        if lead_array
          render json: lead_array
        else 
          render json: {errors: @lead.errors.full_messages}
        end
      end





      # def create   
      #   p "*******************"
      #   p params[:data][:data][:emails]
      #   data = params[:data][:data][:emails]
      #   @lead = data.map { |lead| 
      #   # @lead =  params[:data][:data][:emails].each do |lead|
      #     Lead.new(
      #     confidence_score: lead[:confidence],
      #     first_name: lead[:first_name],
      #     last_name: lead[:last_name],
      #     linkedin: lead[:linkedin],
      #     phone_number: lead[:phone_number],
      #     position: lead[:position],
      #     email: lead[:value]
      #     )
      #   }

      #   if @lead.save
      #       render json: @lead
      #   else
      #       render json: {errors: @lead.errors.full_messages}
      #   end
      # end

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
