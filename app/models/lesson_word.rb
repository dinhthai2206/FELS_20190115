class LessonWord < ApplicationRecord
  belongs_to :lesson
  belongs_to :word

  validates :lesson_id, presence: true
  validates :word_id, presence: true

end
