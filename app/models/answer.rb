class Answer < ApplicationRecord
  belongs_to :word, inverse_of: :answers

  validates :content, presence: true
  validates :correct, presence: true

end
