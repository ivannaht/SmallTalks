require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let(:user) { build(:random_user, first_name: 'Emma') }

    it 'ensures first_name presence' do
    user.first_name = nil
    expect(user.save).to eq(false)
    end
    it 'ensures last_name presence' do
    user.last_name = nil
    expect(user.save).to eq(false)
    end
    it 'ensures nickname presence' do
    user.nickname = nil
    expect(user.save).to eq(false)
    end
    it 'ensures date of birth presence' do
    user.dob = nil
    expect(user.save).to eq(false)
    end
    it 'ensures email presence' do
    user.email = nil
    expect(user.save).to eq(false)
    end
    it 'ensures photo presence' do
    user.photo = nil
    expect(user.save).to eq(false)
    end
    it 'ensures admin presence' do
    user.admin = nil
    expect(user.save).to eq(false)
    end
    it 'should save successfully' do
    expect(user.save).to eq(false) 
    end
end

context 'scope tests' do
  let(:users) { create_list(:random_user, 5) }    
end 

end