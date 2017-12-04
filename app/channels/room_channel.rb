class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"
    # stream_from "some_channel"
  end

  def unsubscribed
    
    # Any cleanup needed when channel is unsubscribed
  end

  def post_message(data)
    if Message.create(text: data['message']) then
      ActionCable.server.broadcast	'chat',	message:	data['message']
    else
      Rails.logger.error "失敗"
    end
  end
end
