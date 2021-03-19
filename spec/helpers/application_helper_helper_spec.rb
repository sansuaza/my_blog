require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelperHelper. For example:
#
# describe ApplicationHelperHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  let(:logged_user) { create :user }
  let(:user_to_check) { create :user }
  before(:each) {  allow(helper).to receive(:current_user).and_return(logged_user) }
  context 'check it current_user is following another user' do
    it 'unfollowed user' do
      expect(helper.following_user?(user_to_check)).to be_falsey
    end

    it 'followed user' do
      helper.current_user.follow(user_to_check)
      expect(helper.following_user?(user_to_check)).to be_truthy
    end
  end

  context 'permissions to comment an article' do
    it "can't comment the article" do
      expect(helper.can_comment?(user_to_check)).to be_falsey
    end

    it 'can comment the article' do
      helper.current_user.follow(user_to_check)
      expect(helper.can_comment?(user_to_check)).to be_truthy
    end
  end

end
