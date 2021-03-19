require 'rails_helper'

RSpec.describe Article, type: :model do
  subject(:user) { create :user }
  subject do
    Article.new(
      title: 'titulo de el articulo',
      body: 'Cuerpo de el articulo',
      owner: user
    )
  end

  describe 'has necessary validations' do
    it { should belong_to(:owner) }
    it { should have_many(:comments) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body) }
    it { should validate_uniqueness_of(:title) }
  end
end
