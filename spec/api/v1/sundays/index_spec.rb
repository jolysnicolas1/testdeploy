require 'rails_helper'

RSpec.describe "sundays#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/sundays", params: params
  end

  describe 'basic fetch' do
    let!(:sunday1) { create(:sunday) }
    let!(:sunday2) { create(:sunday) }

    it 'works' do
      expect(SundayResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['sundays'])
      expect(d.map(&:id)).to match_array([sunday1.id, sunday2.id])
    end
  end
end
