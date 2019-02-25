class Word < ApplicationRecord
  belongs_to :category
  has_many :lesson_words
  has_many :answers, inverse_of: :word, dependent: :destroy
  has_one :right_answer, ->{where(correct: "right")}, class_name: "Answer"

  validates :content, presence: true
  validates :category_id, presence: true

  accepts_nested_attributes_for :answers, 
    reject_if: proc {|attributes| attributes['content'].blank? && attributes['correct'].blank?},
    allow_destroy: true

  scope :all_words, -> do
    includes(:category, :right_answer)
  end

end
