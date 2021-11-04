require 'rails_helper'

RSpec.describe Talk, type: :model do
  context 'validation tests' do 
  it 'ensures title presence' do
  talk = Talk.new(text: 'Text test test test test test test one two', photo: 'photo url2').save
  expect(talk).to eq(false)
  end
  it 'ensures text presence' do
  talk = Talk.new(title: 'Title test test test test test test one two', photo: 'photo url2').save
  expect(talk).to eq(false)   
  end
  it 'ensures photo presence' do
  talk = Talk.new(title: 'Title test test test test test test one two', text: 'Text  one two').save
  expect(talk).to eq(false)   
  end
  it 'should save successfully' do end

  end

  context 'scope tests' do 
    let (:params) {{title: 'test title test test test test test test', text: 'test text test test test test test test', photo: 'test photo' }}
    before (:each) do
      Talk.new(params).save
      Talk.new(params).save
      Talk.new(params).save
      Talk.new(params).save
    
    
    end
  
  end

end

