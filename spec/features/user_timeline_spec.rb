require 'spec_helper'

feature "User's timeline" do
  before do
    @user = FactoryGirl.create(:user)
    @toot = FactoryGirl.create(:toot, user: @user)
    @other_user = FactoryGirl.create(:user)
    @other_toot = FactoryGirl.create(:toot, user: @other_user)
    @user.followeds << @other_user
    sign_in(@user)
  end

  scenario "should render the users toot stream if user logged in" do
    visit user_path(@user)

    expect(page).to have_selector(".toots .panel", count: 2)
  end
  
  scenario "should render only a user's tweets when viewed by another user" do
    @other_user.followeds << @user
    visit user_path(@other_user)

    expect(page).to have_selector(".toots .panel", count: 1)
  end

  scenario "should render toots in reverse chronological order" do
    FactoryGirl.create(:toot, user: @user, created_at: 1.day.from_now, body: "Newer toot")
    visit user_path(@user)

    expect(page).to have_content("Newer toot")
  end
end
