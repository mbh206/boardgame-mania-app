class User < ApplicationRecord
  has_many :bookings
  has_many :offers
  has_many :reviews
  has_many :bookings_as_owner, through: :offers, source: :bookings
  has_many :reviews, through: :offers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
