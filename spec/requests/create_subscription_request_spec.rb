# when a customer creates a new subscription it should:
#     - create a subscription record with that customer's id
#     - create 3-5 subscription_tea records with subscription id and each tea id selected
# When the create a subscription endpoint is reached it"
# - routes to the new subscription controller create method
# - creates a new subscription and creates a new subscription tea record
require 'rails_helper'

RSpec.describe 'subscribe a customer to a tea subscription' do
  describe 'POST /api/v1/subscription' do
    let!(:headers) {{ "CONTENT_TYPE" => "application/json" }}
    let!(:customer) {create :customer}
    let!(:teas) {create_list(:tea, 3)}
  
    describe 'when all attributes are present' do
      it 'successfully creates a record of subscription and subscription tea for the customer' do
        body = JSON.generate(customer_id: customer.id, title: "Variety Pack", frequency: "Weekly", price: 30, teas: [teas[0].id, teas[1].id, teas[2].id])

        post '/api/v1/subscriptions', params: body, headers: headers

        expect(response).to(be_successful)
        expect(status).to eq(201)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data]).to have_key(:id)
        expect(results[:data]).to have_key(:type)
        expect(results[:data]).to have_key(:attributes)
        expect(results[:data][:attributes][:title]).to eq("Variety Pack")
        expect(results[:data][:attributes][:frequency]).to eq("Weekly")
        expect(results[:data][:attributes][:status]).to eq("active")
        expect(results[:data][:attributes][:customer_id]).to be_a(Integer)
        expect(results[:data][:attributes][:price]).to be_a(Float)
      end
    end
  end
end