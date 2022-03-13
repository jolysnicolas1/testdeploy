require 'rails_helper'

RSpec.describe SundayResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'sundays',
          attributes: attributes_for(:sunday)
        }
      }
    end

    let(:instance) do
      SundayResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Sunday.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:sunday) { create(:sunday) }

    let(:payload) do
      {
        data: {
          id: sunday.id.to_s,
          type: 'sundays',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SundayResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { sunday.reload.updated_at }
      # .and change { sunday.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:sunday) { create(:sunday) }

    let(:instance) do
      SundayResource.find(id: sunday.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Sunday.count }.by(-1)
    end
  end
end
