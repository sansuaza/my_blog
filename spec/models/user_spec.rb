require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Has neccesary validations" do
    it {should validate_uniqueness_of(:username)}
    it {should have_many(:following_users)}
    it {should have_many(:follower_users)}
    it {should have_many(:articles)}
  end

  describe '#save' do
    subject(:user) {create :user}

    it 'is persisted' do
      expect(user.save).to eq true
    end
  end
end
