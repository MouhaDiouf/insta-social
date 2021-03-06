# frozen_string_literal: true

require 'rails_helper'

feature 'Friendship creation' do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  scenario 'Sending a friend request and incrementing the notifications' do
    login user
    click_on 'Logout'
    login user2
    expect do
      click_button 'Add as a friend'
    end.to change(Friendship, :count).by(1)
    expect(user.notifications_count).to be(1)
  end

  scenario 'Accept friendship request' do
    process_users(user, user2)
    expect(Friendship.last.confirmed).to be(true)
  end

  scenario 'Checks if two inversed rows gets created in the db' do
    process_users(user, user2)
    expect(user.friends).to include(user2)
    expect(user2.friends).to include(user)
  end
end
