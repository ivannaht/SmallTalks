require 'rails_helper'

RSpec.describe "MyTalks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/my_talks/index"
      expect(response).to have_http_status(:success)
    end
  end


  

end
