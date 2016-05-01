require 'spec_helper'

feature "User logout" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Login"
    submit_login_form(user.username, user.password)

    click_on "Logout"
    expect(page).to have_content("Logged out successfully")
  end
end
