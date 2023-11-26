class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @event = Event.find(params[:event_id])
    @message.chatroom = @event.chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @message.chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      redirect_to event_path(@event)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
