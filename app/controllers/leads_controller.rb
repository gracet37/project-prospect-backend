require_relative "./yelp_controller.rb" 

class LeadsController < ApplicationController

  def index 
  end

  def create 
  end

  def show 
  end

  def destroy
  end

  #  YELP API SEARCH FOR COMPANIES
  def search
    query_category = params[:categories]
    query_location = params[:location]
    p query_location
    p query_category
    results = YelpApiAdapter.search(query_category, query_location)
    render json: {message: 'YELP API', results: results}
end

end 