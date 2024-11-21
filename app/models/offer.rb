class Offer < ApplicationRecord
  belongs_to :boardgame
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
end
