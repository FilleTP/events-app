class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update]
  def new
    @event = Event.new
  end

  def index
    @events = Event.future_events
    @passed_events = Event.passed_events
  end

  def show
    @review = Review.new
    @comment = Comment.new
    @message = Message.new
  end

  def edit
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to event_path(@event), notice: "Event updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @event = Event.new(event_params)
    start_date, end_date = event_params[:date_range].split(' - ')
    @event.start_date = start_date
    @event.end_date = end_date
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event), notice: "Event created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :address, :date_range)
  end
end
