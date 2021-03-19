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
  before(:each) { sign_in logged_user }

  context 'following user' do
    it 'unfollowed user' do
      expect described_class.following_user?(user_to_check).to be.true
    end
  end
end
