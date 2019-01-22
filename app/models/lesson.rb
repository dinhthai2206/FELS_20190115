class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :lesson_words

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :status, presence: true

end
