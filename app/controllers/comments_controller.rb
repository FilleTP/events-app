class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.commentable = Review.find(params[:review_id])
    comment.user = current_user
    event = Event.find(params[:event_id])
    if comment.save
      redirect_to event_path(event), notice: "comment added"
    else
      redirect_to event_path(event), status: :unprocessable_entity, alert: "comment could not be added"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :event_id, :review_id)
  end
end
