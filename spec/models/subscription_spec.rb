require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to(:customer) }
    it { should have_many(:subscription_teas) }
    it { should have_many(:teas).through(:subscription_teas) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:frequency) }
    it { should validate_numericality_of(:price) }
  end
end
