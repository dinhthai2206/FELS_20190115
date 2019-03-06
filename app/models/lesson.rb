class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :lesson_words
  has_many :words, through: :lesson_words

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :status, presence: true

  enum status: {not_answer: 0, answered: 1}

  after_create :add_words

  scope :order_created_desc,->{order created_at: :desc}

  private
  def add_words
    words_adding = category.words.order("RAND()").limit(20)
    raise ActiveRecord::RecordInvalid.new(self) if words_adding.count < 20
    words << words_adding
  end
end
