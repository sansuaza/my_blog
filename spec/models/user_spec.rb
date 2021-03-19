require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Has neccesary validations' do
    it { should validate_uniqueness_of(:username) }
    it { should have_many(:following_users) }
    it { should have_many(:follower_users) }
    it { should have_many(:articles) }
  end

  context 'saved using factory' do
    # Using the factory
    subject(:user) {create :user}
    it 'is persisted' do
      expect(user.save).to eq true
    end
  end

  context 'validations from scratch' do
    context 'user with invalid username' do
      subject do
        described_class.new(
          first_name: 'Javier',
          last_name: 'Perez',
          username: 'user',
          email: 'correo@mail.com',
          password: '123456'
        )
        # Caused by short username
        it { is_expected.not_to be_valid }
      end
    end

    context 'user with valid atributes' do
      subject(:valid_user) do
        described_class.new(
          first_name: 'Javier',
          last_name: 'Perez',
          username: 'japerez',
          email: 'correo@mail.com',
          password: '123456'
        )
      end
      it { is_expected.to be_valid }

      context 'after save valid user' do
        before(:each) { valid_user.save }
        it { is_expected.to be_persisted }
      end
    end
  end
end
