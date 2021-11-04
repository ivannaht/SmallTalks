require 'rails_helper'

RSpec.describe Feedback, type: :model do
  context 'validation tests' do 
    it 'ensures recommendation presence' do
    feedback = Feedback.new(experience: 'Experience one two').save
    expect(feedback).to eq(false)
    end
    it 'ensures experience presence' do
    feedback = Feedback.new(recommendation: 'yes').save
    expect(feedback).to eq(false)   
    end    
    it 'should save successfully' do end
end

context 'scope tests' do 
  let (:params) {{recommendation: 'test recommendation', experience: 'test experience' }}
  before (:each) do
    Feedback.new(params).save
    Feedback.new(params).save
    Feedback.new(params).save
    Feedback.new(params).save
  
  
  end

end

end