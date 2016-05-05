require 'spec_helper'

feature "Sign up" do

  scenario "successfully creates a user account and logs the user in" do
    visit root_path
    click_on "Register"

    fill_in "First name", with: "Pepe"
    fill_in "Username", with: "pepe"
    fill_in "Password", with: "stinky"
    fill_in "Password confirmation", with: "stinky"
    click_on "Submit"

    expect(page).to have_content "Welcome Pepe!"
  end
end
