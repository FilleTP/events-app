class EventAttendeesController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    event_attendee = EventAttendee.new(user: current_user, event: event)
    if event_attendee.save
      redirect_to event_path(event), notice: "You have joined the event!"
    else
      redirect_to event_path(event), status: :unprocessable_entity, alert: "There was an issue joining the event..!"
    end
  end

  def destroy
    event_attendee = EventAttendee.find(params[:id])
    event = event_attendee.event
    event_attendee.destroy
    redirect_to event_path(event), notice: "You are not attending anymore!"
  end
end
