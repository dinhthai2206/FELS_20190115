class ChatroomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  scope :by_user, ->(user) {where(user_id: user.id)}
end
