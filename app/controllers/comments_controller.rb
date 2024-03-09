# frozen_string_literal: true

class CommentsController < ApplicationController
  include VotingController
  before_action :find_commentable, :authenticate_user!

  def create
    @comment = @commentable.comments.new comment_params
    @comment.commenter = current_user

    if @comment.save
      redirect_to @commentable, notice: 'Your comment was successfully posted!'
    else
      redirect_to @commentable, notice: "Your comment wasn't posted!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_text)
  end

  def find_commentable
    @commentable = if params[:event_id]
                     Event.find(params[:event_id])
                   elsif params[:location_id]
                     Location.find(params[:location_id])
                   end
  end
end
