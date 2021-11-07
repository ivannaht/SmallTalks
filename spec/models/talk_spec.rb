require 'rails_helper'

RSpec.describe Talk, type: :model do

  context 'validation tests' do 
  let(:talk) { build(:random_talk, title: 'test title') }

    it 'ensures title presence' do
    talk.title = nil
    expect(talk.save).to eq(false)
    end
    it 'ensures text presence' do
    talk.text = nil
    expect(talk.save).to eq(false)
    end
    it 'ensures photo presence' do
    talk.photo = nil
    expect(talk.save).to eq(false)
    end
    it 'ensures theme presence' do
    talk.theme = nil
    expect(talk.save).to eq(false)   
    end
    it 'should save successfully' do
    expect(talk.save).to eq(false)  
    end

  end

  context 'scope tests' do
    let(:talks) { create_list(:random_talk, 5) }    
  end 

end

