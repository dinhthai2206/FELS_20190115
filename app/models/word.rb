require 'elasticsearch/model'

class Word < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :category
  has_many :lesson_words
  has_many :answers, inverse_of: :word, dependent: :destroy
  has_one :right_answer, ->{where(correct: :right)}, class_name: "Answer"
  has_many :choices

  validates :content, presence: true
  validates :category_id, presence: true

  accepts_nested_attributes_for :answers, reject_if: :all_blank,
    allow_destroy: true

  after_save :check_condition

  scope :all_words, -> do
    includes :category, :right_answer
  end

  settings do
    mappings dynamic: false do
      indexes :content, type: :text, analyzer: :english
    end
  end

  private
  def check_condition
    if answers.count != 4 || answers.right.count != 1
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end
end
