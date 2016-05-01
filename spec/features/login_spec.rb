require 'spec_helper'

feature "User login" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Login"

    submit_login_form(user.username, user.password)

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome #{user.first_name}!")
  end

  scenario "unsuccessfully" do
    visit root_path
    click_on "Login"

    submit_login_form("john", "doe")

    expect(page).to have_content("Invalid username or password")
  end
end
