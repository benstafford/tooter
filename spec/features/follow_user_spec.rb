require 'spec_helper'

feature "Follows" do
  scenario "user should be able to follow another Tooter user" do
    @user = FactoryGirl.create(:user)
    @tooter = FactoryGirl.create(:user)
    sign_in(@user)
    visit user_path(@tooter)
    
    click_link "Sniff"

    visit user_followers_path(@tooter)
    expect(page).to have_css('.followers li', text: @user.username)
  end
end
