class ChatRoom < ApplicationRecord
  has_many :chat_messages
  has_msny :chat_room_users
end
