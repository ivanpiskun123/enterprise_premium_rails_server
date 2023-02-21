require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'associations' do
    it { should belong_to(:role) }
    it { should belong_to(:departament).optional }
  end

  describe '#generate_jwt' do
    let(:user) { create(:user) }

    it 'generates a JWT token with id and expiration' do
      jwt = user.generate_jwt
      expect(jwt).not_to be_nil

      decoded_token = JWT.decode(jwt, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')[0]
      expect(decoded_token['id']).to eq(user.id)
      expect(decoded_token['exp']).to be_within(1.minute.to_i).of(60.days.from_now.to_i)
    end
  end
end
