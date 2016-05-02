require 'spec_helper'

describe "User creates toot" do
  scenario "but they're not logged in" do
    visit root_path

    expect(page).to_not have_css "form"
  end
  
  scenario "and sees it on their timeline" do
    user = FactoryGirl.create(:user)
    sign_in(user)
      
    visit root_path
    fill_in "Body", with: "This is my first toot!"
    
    expect { click_on "Submit" }.to change(Toot, :count).by(1)

  end
end
