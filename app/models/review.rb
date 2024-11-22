class Review < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates :description, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true, in: 0..5 }
end
