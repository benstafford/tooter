require 'spec_helper'

feature "Mentions page" do
  scenario "lists all mentions for current user" do
    @user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:mention, 3, user: @user)

    sign_in(@user)
    visit user_mentions_path(@user)

    expect(page).to have_selector('.mentions div.toot', count: 3)
  end
end
