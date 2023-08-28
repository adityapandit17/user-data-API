require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates the format of email' do
      user = User.new(email: 'invalid-email')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('is invalid')
    end
  end
end