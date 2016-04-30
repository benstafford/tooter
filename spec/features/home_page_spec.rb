require 'spec_helper'

feature "Home page" do
  before { @toot = FactoryGirl.create(:toot) }
  
  scenario "displays list of toots" do
    visit root_path
    
    expect(page).to have_css 'ul.toots'
    expect(page).to have_content @toot.body
  end
end
