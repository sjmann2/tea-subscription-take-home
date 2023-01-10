class Subscription < ApplicationRecord
  has_many :customers
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
  validates_presence_of :title, :price, :status, :frequency
  validates_numericality_of :price
end
