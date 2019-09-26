class LeadnotesController < ApplicationController
  
  def index 
  end

  def create 
  end

  def show 
    p params
    leadnote = Leadnote.where(user_id: params[:user_id], lead_id: params[:lead_id])
    if leadnote
      render json: leadnote, include: [:comment, :user, :lead]
    else 
      render json: {errors: "No list found with that user id"}
    end
  end


end 