class RoomChannel < ApplicationCable::Channel
  def subscribed
    chat = Chat.find(params[:room])
    if current_user.can_access?(chat)
      stream_from "room_#{params[:room]}_channel"
    else
      reject
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.new(chat_id: params[:room], content: data['message'])
    message.save
    ActionCable.server.broadcast "room_#{params[:room]}_channel", message: render_message(message)
  end

  private 
    def render_message(message)
      ApplicationController.render(
        partial: 'messages/message',
        locals:  { message: message }
      )
    end
end