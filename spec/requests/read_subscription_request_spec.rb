require 'rails_helper'

RSpec.describe 'view all of a customers subscriptions' do
  describe 'GET /api/v1/subscriptions' do
    let!(:headers) {{ "CONTENT_TYPE" => "application/json" }}
    let!(:customer) {create :customer}
    let!(:teas) {create_list(:tea, 3)}
    let!(:subscription_1) {create :subscription, status: 'active', customer_id: customer.id}
    let!(:subscription_2) {create :subscription, status: 'cancelled', customer_id: customer.id}

    describe 'when parameters are present and correct' do
      it 'lists all subscriptions for a customer, active and cancelled' do
        body = {customer_id: customer.id}

        get '/api/v1/subscriptions', params: body, headers: headers

        expect(response).to be_successful
        expect(status).to eq(200)

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results).to be_a(Hash)
        expect(results[:data]).to be_an(Array)
        expect(results[:data].count).to eq(2)
        subscription = results[:data].first

        expect(subscription[:id]).to be_a(String)
        expect(subscription[:type]).to eq("subscription")
        expect(subscription[:attributes][:title]).to be_a(String)
        expect(subscription[:attributes][:frequency]).to be_a(String)
        expect(subscription[:attributes][:status]).to be_a(String)
        expect(subscription[:attributes][:customer_id]).to be_an(Integer)
        expect(subscription[:attributes][:price]).to be_a(Float)
      end
    end

    describe 'when customer id does not exists' do
      it 'returns a 404 status and error message' do
        body = {customer_id: 34}

        get '/api/v1/subscriptions', params: body, headers: headers
        
        expect(status).to eq(404)

        results = JSON.parse(response.body, symbolize_names: true)
        expect(results[:error]).to eq("Couldn't find Customer with 'id'=34")
      end
    end
  end
end