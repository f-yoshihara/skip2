class RoomChannel < ApplicationCable::Channel
  # subscribedメソッドはコンシューマがサブスクライブ宣言を行うことで呼び出される。
  # 宣言の時の引数のパラメータを受け取ることができる。
  def subscribed
    chat = Chat.find(params[:room])
    if current_speaker.can_access?(chat)
      # ここでは認証した部屋と同室の人のspeakを受け取れるようにしている。
      stream_from "room_#{params[:room]}_channel"
    else
      reject
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # paramsもdataもroom.coffeeで定義されている。
    message = Message.new(chat_id: params[:room], content: data['message'], school: params[:school])
    message.save
    # 同室の人に自分のspeakを発信している。ここでのmessageはオブジェクト
    ActionCable.server.broadcast "room_#{params[:room]}_channel", message: render_message(message, current_speaker)
  end

  private 
    def render_message(message, speaker)
      ApplicationController.render(
        partial: 'messages/message',
        locals:  { message: message, speaker: speaker }
      )
    end
end