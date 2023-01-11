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

    describe 'if all attributes are not present' do
      it 'returns a 400 status and error message' do
        body = JSON.generate(customer_id: customer.id, title: "Variety Pack", frequency: "Weekly", price: 30)
        
        post '/api/v1/subscriptions', params: body, headers: headers

        expect(status).to eq(400)
        expect(response.body).to eq("Error: Parameter missing")
      end
    end
  end
end