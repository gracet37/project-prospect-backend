class LeadnotesController < ApplicationController

  def index 
    leadnotes = Leadnote.all 
    render json: leadnotes
  end

  def create 
   p params
   leadnote = Leadnote.last(status: params[:status], next_steps: params[:next_steps], comments: params[:comments], user_id: params[:user_id], lead_id: params[:lead_id]).first_or_create
    if leadnote.save 
      render json: leadnote
    else 
      render json: {errors: leadnote.errors.full_messages}
    end
  end

  def show 
    p " ***********************LEAD NOTES SHOW ****************************"
    p params
    leadnotes = Leadnote.where(user_id: params[:id])
    if leadnotes
      render json: leadnotes
    else 
      render json: {errors: "No leadnote found with that user id"}
    end
  end

  # def update 
  #   p params
  #   leadnote = Leadnote.find(params[:id])
  #   leadnote = Leadnote.update(leadnote_params)
  #    if leadnote.save 
  #      render json: leadnote
  #    else 
  #      render json: {errors: leadnote.errors.full_messages}
  #    end
  # end

  private

  def leadnote_params
    params.require(:leadnote).permit(:status, :next_steps, :user_id, :lead_id)
  end


end 