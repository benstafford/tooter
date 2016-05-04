require 'spec_helper'

feature "Follows" do
  before do
    @user = FactoryGirl.create(:user)
    @tooter = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario "user should be able to follow another Tooter user" do
    visit user_path(@tooter)
    click_link "Sniff"

    visit user_followers_path(@tooter)
    expect(page).to have_css('.followers li', text: @user.first_name)
  end

  scenario "user should be able to unfollow a followed user" do
    @user.followeds << @tooter
    visit user_path(@tooter)
    click_link "Stop sniffing"

    visit user_followers_path(@tooter)
    expect(page).to_not have_css('.followers li', text: @user.first_name)
  end
end
