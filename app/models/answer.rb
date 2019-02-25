class Answer < ApplicationRecord
  belongs_to :word, inverse_of: :answers

  validates :content, presence: true
  validates :correct, presence: true

  enum correct: {wrong: 0, right: 1}
end
