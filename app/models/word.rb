class Word < ApplicationRecord
  belongs_to :category
  has_many :lesson_words
  has_many :answers, dependent: :destroy

  validates :content, presence: true
  validates :category_id, presence: true
  validates :correct, presence: true
end
