class LeadnotesController < ApplicationController
  
  def index 
  end

  def create 
   p params
  #  leadnote = Leadnote.new(status: params[:status], next_steps: paramsuser_id: params[:user_id])
    # if leadnote.save 
    #   render json: leadnote, include: [:leads]
    # else 
    #   render json: {errors: leadnote.errors.full_messages}
    # end
  end

  def show 
    p params
    leadnote = Leadnote.where(user_id: params[:user_id], lead_id: params[:lead_id])
    if leadnote
      render json: leadnote, include: [:comments]
    else 
      render json: {errors: "No leadnote found with that user id"}
    end
  end


end 