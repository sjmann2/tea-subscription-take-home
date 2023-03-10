class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
  validates_presence_of :title, :price, :status, :frequency
  validates_numericality_of :price
end
