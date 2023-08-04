require 'rails_helper'

RSpec.describe 'Api::EnronDataController', type: :request do
  describe 'POST /api/enron_data/search' do
    before do
      let!(:message) {FactoryBot.create(:message)}
      Sunspot.commit
    end
    context 'with valid parameters' do

      it 'returns http success' do
        post '/api/enron_data/search', params: { search_text: '' }
        expect(response).to have_http_status(:success)
      end

      it 'finds a single keyword' do
        post '/api/enron_data/search', params: { search_text: 'fraud' }
        expect(JSON.parse(response.body)[0]).to eq(message)
      end


    end

  end

end
