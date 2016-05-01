require 'spec_helper'

feature "User logout" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Login"
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Submit"

    click_on "Logout"
    expect(page).to have_content("Logged out successfully")
  end
end
