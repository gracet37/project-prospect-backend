class LeadlistsController < ApplicationController
  
  def index
    @leadlists = Leadlist.all
    render json: @leadlists 
  end

  def create 
    # @leadlist = Leadlist.where(:list_id: params[:list_id], :lead_id: params[:lead_id]).first_or_create
    # if @leadlist

  end

  def show 
    
  end

end 
