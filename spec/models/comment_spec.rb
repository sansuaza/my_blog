require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'has necessary validations' do
    it {should belong_to(:article)}
    it {should validate_presence_of(:body)}
  end
end
