require 'rails_helper'

RSpec.describe Article, type: :model do

  subject(:user) {create :user}
  subject{ Article.new(
    title: "titulo de el articulo",
    body: "Cuerpo de el articulo",
    owner: user)
  }

  describe 'has necessary validations' do
    it {should belong_to(:owner)}
    it {should have_many(:comments)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}
    it {should validate_length_of(:body)}
    it {should validate_uniqueness_of(:title)}
  end

 # describe '#save' do#
 #   subject(:article){ create :article}
#
 #   it 'is persisted' do
 #     #p article.owner.full_name
 #     #expect(article.save).to eq
 #     true
 #   end

  #end
end


# spec/models/task_spec.rb

#RSpec.describe Task, type: :model do
#  describe '#save' do
#    let(:participants_count) { 4 }
#    subject(:task) { build(:task_with_participants, participants_count: participants_count) }
#
#    it 'is persisted' do
#      expect(task.save).to eq true
#    end
#
#    context 'after save' do
#      before(:each) { task.save }
#
#      it 'has all associated participants' do
#        expect(task.participating_users.count).to eq participants_count
#        expect(Participant.count).to eq participants_count
#      end
#    end
#  end
#end
