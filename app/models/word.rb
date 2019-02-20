class Word < ApplicationRecord
  belongs_to :category
  has_many :lesson_words
  has_many :answers, inverse_of: :word, dependent: :destroy

  validates :content, presence: true
  validates :category_id, presence: true

  accepts_nested_attributes_for :answers, 
    reject_if: proc {|attributes| attributes['content'].blank? && attributes['correct'].blank?},
    allow_destroy: true

end
