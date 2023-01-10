class Tea < ApplicationRecord
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
  validates_presence_of :title, :description, :temperature, :brew_time
  validates_numericality_of :temperature, :brew_time
end
