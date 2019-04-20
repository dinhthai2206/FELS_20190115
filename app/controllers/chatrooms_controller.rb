class ChatroomsController < ApplicationController
  before_action :find_chatroom, only: [:show, :edit, :update, :destroy]

  def index
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.new
    @joined_room_ids = current_user.joined_rooms.pluck(:id)
  end

  def show
    @messages = @chatroom.messages.all_messages
  end

  def edit
  end

  def create
    @chatroom = Chatroom.new chatroom_params
    if @chatroom.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to chatrooms_path
  end

  def update
    if @chatroom.update chatroom_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to @chatroom
  end

  def destroy
    @chatroom.destroy
    redirect_to chatrooms_url
    flash[:success] = t ".success"
  end

  private
  def find_chatroom
    @chatroom = Chatroom.find(params[:id])
  end

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end
end
