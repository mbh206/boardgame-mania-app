class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  
  validates :total_price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  enum status: {pending: 0, accepted: 1, rejected: 2}, _default: :pending

end
