require 'rails_helper'

RSpec.describe 'cancelling a customers tea subscription' do
  describe 'PATCH /api/v1/subscriptions' do
    let!(:customer_1) { create :customer }
    let!(:customer_2) { create :customer }

    let!(:subscription_1) { create :subscription, status: 'active', customer: customer_1 }
    let!(:subscription_2) { create :subscription, status: 'active', customer: customer_2 }

    let!(:headers) {{'CONTENT-TYPE' => 'application/json'}}

    describe 'if all parameters are present' do
      it 'updates the status of a subscription to be cancelled' do
        body = JSON.generate({subscription_id: subscription_1.id, status: 'cancelled'})
        patch '/api/v1/subscriptions', params: body, headers: headers

        expect(response).to be_successful
        expect(status).to eq(200)

        results = JSON.parse(response.body, symbolize_names: true)
        expect(results[:data]).to have_key(:id)
        expect(results[:data]).to have_key(:type)
        expect(results[:data]).to have_key(:attributes)
        expect(results[:data][:attributes][:status]).to eq("cancelled")
      end
    end

    describe 'if record does not exist' do
      it 'returns a 404 status and error message' do
        body = JSON.generate({status: 'cancelled'})
        patch '/api/v1/subscriptions', params: body, headers: headers

        expect(status).to eq(404)

        results = JSON.parse(response.body, symbolize_names: true)
        expect(results[:error]).to eq("Couldn't find Subscription without an ID")
      end
    end

    describe 'if parameters are missing' do
      it 'returns subscription attributes unchanged' do
        body = JSON.generate({subscription_id: subscription_2.id})
        patch '/api/v1/subscriptions', params: body, headers: headers
        
        expect(response).to be_successful
        expect(status).to eq(200)

        results = JSON.parse(response.body, symbolize_names: true)
        expect(results[:data]).to have_key(:id)
        expect(results[:data]).to have_key(:type)
        expect(results[:data]).to have_key(:attributes)
        expect(results[:data][:attributes][:status]).to eq("active")
      end
    end
  end
end