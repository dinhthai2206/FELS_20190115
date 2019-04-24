class MessagesController < ApplicationController
  before_action :find_chatroom

  def create
    @message = @chatroom.messages.new message_params
    @message.user = current_user
    @create_success = true if @message.save
    respond_to do |format| 
      format.js
    end
  end

  private
  def find_chatroom
    @chatroom = Chatroom.find_by id: params[:chatroom_id]
  end

  def message_params
    params.require(:message).permit :content
  end
end
