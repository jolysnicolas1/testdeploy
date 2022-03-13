require 'rails_helper'

RSpec.describe "sundays#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/sundays", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:sunday)
    end
    let(:payload) do
      {
        data: {
          type: 'sundays',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SundayResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Sunday.count }.by(1)
    end
  end
end
