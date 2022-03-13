require 'rails_helper'

RSpec.describe "sundays#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/sundays/#{sunday.id}", payload
  end

  describe 'basic update' do
    let!(:sunday) { create(:sunday) }

    let(:payload) do
      {
        data: {
          id: sunday.id.to_s,
          type: 'sundays',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SundayResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { sunday.reload.attributes }
    end
  end
end
