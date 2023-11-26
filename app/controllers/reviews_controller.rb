class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.event = Event.find(params[:event_id])
    @review.user = current_user
    if @review.save
      redirect_to event_path(@review.event), notice: "Your review got added"
    else
      redirect_to event_path(@review.event), alert: "Your review didnt get added"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :event_id)
  end
end
