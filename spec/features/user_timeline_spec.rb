require 'spec_helper'

feature "User's timeline" do
  before do
    @user = FactoryGirl.create(:user)
    @toot = FactoryGirl.create(:toot, user: @user)
    @other_user = FactoryGirl.create(:user)
    @other_toot = FactoryGirl.create(:toot, user: @other_user)
    sign_in(@user)
  end

  scenario "should render only the user's toots" do
    visit user_path(@user)

    expect(page).to have_selector(".toots li", count: 1)
  end

  scenario "should render toots in reverse chronological order" do
    FactoryGirl.create(:toot, user: @user, created_at: 1.day.from_now, body: "Newer toot")
    visit user_path(@user)

    expect(page.first('li')).to have_content("Newer toot")
  end
end
