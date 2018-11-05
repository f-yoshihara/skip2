channel = 'RoomChannel'
$(document).on 'turbolinks:load', ->
  room = $('#room_id').val()

  # ここでチャンネルと部屋を指定してサブスクライバ宣言をしている。
  # これを行うことでサーバ側のsubscribedアクションを呼び出している。
  # なので今回のように'turbolinks:load'にすると認証が重複されておこなわる可能性がある。
  App.room = App.cable.subscriptions.create { channel: channel, room: room },
    connected: ->
      # Called when the subscription is ready for use on the server
    disconnected: ->
      # Called when the subscription has been terminated by the server
    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
      $('#messages').append data['message']

    # ここでクライアントサイドのspeakアクションを定義している。
    # サーバサイドのspeakアクションを呼び出してmessageパラメータとしてmessageを渡している。
    speak: (message) ->
      @perform 'speak', message: message

    $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
      if event.keyCode is 13 # return = send
        # 上記のクライアントサイドのspeakアクションを実行している。
        App.room.speak event.target.value
        # valueを空にしている
        event.target.value = ''
        event.preventDefault()