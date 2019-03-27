class Choice < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  belongs_to :word
  belongs_to :answer, optional: true

  enum is_correct_answer: {wrong: 0, right: 1}
end
