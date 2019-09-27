# class CommentsController < ApplicationController
#   def create 
#     p params
#     comment = Comment.new(leadnote_id: params[:leadnote_id], status: params[:status])
#      if comment.save 
#        render json: comment
#      else 
#        render json: {errors: comment.errors.full_messages}
#      end
#    end
 
# end
