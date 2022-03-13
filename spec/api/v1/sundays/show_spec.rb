require 'rails_helper'

RSpec.describe "sundays#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sundays/#{sunday.id}", params: params
  end

  describe 'basic fetch' do
    let!(:sunday) { create(:sunday) }

    it 'works' do
      expect(SundayResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('sundays')
      expect(d.id).to eq(sunday.id)
    end
  end
end
