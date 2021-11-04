require 'rails_helper'

RSpec.describe "Talks", type: :request do
  describe 'GET #index' do

    # current_user.logged_in?
    it "returns a success response" do
      get "/talks"
      expect(response).to be_success
  end
end

context 'GET #show' do 
 # current_user.logged_in?
  it 'returns a success response' do
    talk = Talk.create!(title: 'test title test test test test test test', text: 'test text test test test test test test', photo: Rack::Test::UploadedFile.new('spec/support/test_image.jpg', 'image/jpg'))
    get :show, params: {id: talk.to_param}
    expect(response).to be_success
  end
end




end
