# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context 'Testing for model presence and validations' do
    it 'Tests if model is valid' do
      expect(user).to be_valid
    end

    it 'Test if email is present' do
      user.email = ' '
      expect(user).not_to be_valid
    end

    it 'Tests if the email is valid' do
      user.email = 'useremail'
      expect(user).not_to be_valid
    end

    it 'Tests if the password is present' do
      user.password = ' '
      expect(user).not_to be_valid
    end

    it "Tests if the password's length is at least 6" do
      user.password = '12345'
      expect(user).not_to be_valid
    end
  end
end
