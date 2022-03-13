require 'rails_helper'

RSpec.describe SundayResource, type: :resource do
  describe 'serialization' do
    let!(:sunday) { create(:sunday) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(sunday.id)
      expect(data.jsonapi_type).to eq('sundays')
    end
  end

  describe 'filtering' do
    let!(:sunday1) { create(:sunday) }
    let!(:sunday2) { create(:sunday) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: sunday2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([sunday2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:sunday1) { create(:sunday) }
      let!(:sunday2) { create(:sunday) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            sunday1.id,
            sunday2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            sunday2.id,
            sunday1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
