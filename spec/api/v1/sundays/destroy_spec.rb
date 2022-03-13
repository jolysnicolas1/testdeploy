require 'rails_helper'

RSpec.describe "sundays#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/sundays/#{sunday.id}"
  end

  describe 'basic destroy' do
    let!(:sunday) { create(:sunday) }

    it 'updates the resource' do
      expect(SundayResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Sunday.count }.by(-1)
      expect { sunday.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
