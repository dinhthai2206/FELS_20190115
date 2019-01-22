class Answer < ApplicationRecord
  belongs_to :word

  validates :content, presence: true
  validates :word_id, presence: true
end
