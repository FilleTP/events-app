class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.future_events
    @passed_events = Event.passed_events
  end

  def show
    @event = Event.find(params[:id])
    @review = Review.new
    @comment = Comment.new
  end
end
