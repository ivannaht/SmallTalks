require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context 'validation tests' do
    let(:feedback) { build(:random_feedback, experience: 'test feedback') } 
    it 'ensures recommendation presence' do
    feedback.recommendation = nil
    expect(feedback.save).to eq(false)
    end
    it 'ensures experience presence' do
    feedback.experience = nil
    expect(feedback.save).to eq(false) 
    end    
    it 'should save successfully' do
    expect(feedback.save).to eq(false) 
    end
end

context 'scope tests' do
  let(:feedbackss) { create_list(:random_feedback, 3) }    
end 

end