class ChatroomUsersController < ApplicationController
  before_action :set_chatroom

  def create
    @chatroom_user = @chatroom.chatroom_users.
      by_user(current_user).first_or_create
    redirect_to @chatroom
  end

  def destroy
    @chatroom_user = @chatroom.chatroom_users.
      by_user(current_user).destroy_all
    redirect_to chatrooms_path
  end

  private
  def set_chatroom
    @chatroom = Chatroom.find_by id: params[:chatroom_id]
  end
end
