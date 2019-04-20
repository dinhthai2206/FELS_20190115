class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :content, presence: true

  scope :all_messages, -> do
    includes(:user).order(created_at: :desc).limit(50).reverse
  end
end
