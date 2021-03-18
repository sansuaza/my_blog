require 'rails_helper'

RSpec.describe Followship, type: :model do

  context 'Has necessary validations' do
    it {should belong_to(:follower_user)}
    it {should belong_to(:following_user)}
    it {should validate_presence_of(:follower_user_id)}
  end
end
