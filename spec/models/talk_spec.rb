require 'rails_helper'

RSpec.describe Talk, type: :model do
  context 'validation tests' do 
  it 'ensures title presence' do
  talk = Talk.new(text: 'Text1', photo: 'photo url1').save
  expect(talk).to eq(false)
  end
  it 'ensures text presence' do
  talk = Talk.new(title: 'Title1', photo: 'photo url1').save
  expect(talk).to eq(false)   
  end
  it 'ensures photo presence' do
  talk = Talk.new(title: 'Title1', text: 'Text1').save
  expect(talk).to eq(false)   
  end
  it 'should save successfully' do end

  end

  context 'scope tests' do end

end

