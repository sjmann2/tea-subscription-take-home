class Customer < ApplicationRecord
  belongs_to :subscription
  validates_presence_of :first_name, :last_name, :email, :address
end
