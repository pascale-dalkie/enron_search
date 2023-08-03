require 'rails_helper'

RSpec.describe "Api::EnronData", type: :request do
  describe "GET /search" do
    it "returns http success" do
      get "/api/enron_data/search"
      expect(response).to have_http_status(:success)
    end
  end

end
