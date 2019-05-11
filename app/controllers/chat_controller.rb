class ChatController < ApplicationController
  def create
    current_user_chat_rooms = ChatRoomUser.where(user_id: current_user.id).map(&:chat_room)
    chat_room = ChatRoomUser.where(chat_room: current_user_chat_rooms, user_id: params[:user_id]).map(&:chat_room).first
    p "#####chat_room1#####"
    p  chat_room
    p "#####"
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
    p "#####chat_room2#####"
    p chat_room
    p "#####"
    @chat_room_user = chat_room.chat_room_users.where.not(user_id: current_user.id).first.user
    #bybug.pry (@chat_room_user)
    @chat_messages = ChatMessage.where(chat_room: chat_room).order(:created_at)
    @my_messages = ChatMessage.where(chat_room: chat_room, user_id: current_user.id)
    # binding.pry (@chat_messages)
  end
end
