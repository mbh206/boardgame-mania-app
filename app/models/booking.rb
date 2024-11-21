class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  def pending?
    status == 0
  end
  
end
