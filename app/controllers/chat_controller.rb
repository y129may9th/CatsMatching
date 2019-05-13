class ChatController < ApplicationController
  def create
    current_user_chat_rooms = ChatRoomUser.where(user_id: current_user.id).map(&:chat_room)
    chat_room = ChatRoomUser.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&:chat_room).first
    # binding.pry

    if chat_room.blank?
        chat_room = ChatRoom.create
        ChatRoomUser.create(chat_room: chat_room, user_id: current_user.id)
        ChatRoomUser.create(chat_room: chat_room, user_id: params[:user_id])
    end

    redirect_to action: :show, id: chat_room.id
  end

  def show
    chat_room = ChatRoom.find_by(id: params[:id])
    @chat_room_user = chat_room.chat_room_users.where.not(user_id: current_user.id).first.user
    # binding.pry (@chat_messages)
    @chat_messages = ChatMessage.where(chat_room: chat_room).order(:created_at)
    @my_messages = ChatMessage.where(chat_room: chat_room, user_id: current_user.id)
  end
end
