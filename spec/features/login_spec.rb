require 'spec_helper'

feature "User login" do
  scenario "successfully" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Login"

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome #{user.first_name}!")
  end

  scenario "unsuccessfully" do
    visit root_path
    click_on "Login"

    fill_in "Username", with: "john"
    fill_in "Password", with: "doe"
    click_on "Submit"

    expect(page).to have_content("Invalid username or password")
  end
end
