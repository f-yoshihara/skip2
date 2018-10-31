class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    # room = Room.find(params['room'])
    # if current_user.can_access?(room)
    #   stream_from "messages_#{params['room']}_channel"
    # else
    #   reject
    # end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(content: data['message'])
    message.save
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private 
    def render_message(message)
      ApplicationController.render(
        partial: 'messages/message',
        locals:  { message: message }
      )
    end
end