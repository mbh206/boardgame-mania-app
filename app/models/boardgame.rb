class Boardgame < ApplicationRecord
  has_many :offers
  validates :name, presence: true 
end
