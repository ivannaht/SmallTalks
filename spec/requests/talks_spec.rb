require 'rails_helper'

RSpec.describe "Talks", type: :request do
  describe 'GET #index' do
    it "returns a success response" do
      get :index
      expect(response).to be_success
  end
end

context 'GET #show' do 
  it 'returns a success response' do
    talk = Telk.create!(title: 'test title test test test test test test', text: 'test text test test test test test test', photo: 'test photo')
    get :show, params: {id: talk.to_param}
    expect(response).to be_success
  end
end


end
