class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  
  validates :total_price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


  def pending?
    status == 0
  end
end
