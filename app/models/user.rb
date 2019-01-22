class User < ApplicationRecord
  has_many :lessons, dependent: :destroy

  validates :name, presence: true

end
