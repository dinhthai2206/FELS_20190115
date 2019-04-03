class Lesson < ApplicationRecord
  include PublicActivity::Common

  belongs_to :user
  belongs_to :category
  has_many :lesson_words
  has_many :words, through: :lesson_words
  has_many :choices
  has_many :right_choices, ->{where(is_correct_answer: "right")}, class_name: "Choice"

  accepts_nested_attributes_for :choices, allow_destroy: true

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :status, presence: true

  delegate :title, to: :category

  enum status: {not_answer: 0, answered: 1}

  after_create :add_words_and_choices, :activity_create
  after_update :change_status, :activity_update

  scope :order_created_desc,->{order created_at: :desc}

  def full_title
    title + " " + id.to_s
  end

  private
  def add_words_and_choices
    words_adding = category.words.order("RAND()").limit(20)
    raise ActiveRecord::RecordInvalid.new(self) if words_adding.count < 20
    words << words_adding
    words.each do |word|
      choices.create(user_id: user.id, word_id: word.id)
    end
  end

  def change_status
    choices.each do |choice|
      return unless choice.answer.present?
      choice.update_attributes(is_correct_answer: choice.answer.correct)
    end
  end

  %w[create update].each do |action|
    define_method("activity_#{action}") do
      create_activity action, owner: user
    end
  end
end
