class Boardgame < ApplicationRecord
  has_many :offers, dependent: :destroy
  validates :name, presence: true
end
