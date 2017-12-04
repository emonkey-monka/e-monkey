class ChatController < ApplicationController
  def index
    @message = Message.all
  end
end
