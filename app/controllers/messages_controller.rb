class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @message = Message.new
    @messages = @room.messages
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.create(message_params)
    if @message.persisted?
      redirect_to room_messages_path(@room)
    else
      redirect_to root_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:username, :body)
    end
end
