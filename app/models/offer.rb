class Offer < ApplicationRecord
  belongs_to :boardgame
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  has_many :reviews, dependent: :destroy
end
