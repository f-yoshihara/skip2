class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(content: data['message'])
    message.save
    ActionCable.server.broadcast 'room_channel', message: data['message']
  end
end