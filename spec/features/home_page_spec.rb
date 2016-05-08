require 'spec_helper'

feature "Home page" do
  before do
    @user = FactoryGirl.create(:user)
    @toot = FactoryGirl.create(:toot, user: @user) 
    @second_user = FactoryGirl.create(:user)
    @second_toot = FactoryGirl.create(:toot, user: @second_user)
    @third_user = FactoryGirl.create(:user)
    @third_tweet = FactoryGirl.create(:toot, user: @third_user)
  end
  
  scenario "displays list of all toots when user not logged in" do
    visit root_path
    
    expect(page).to have_css 'div.toots'
    expect(page).to have_content @toot.body
    expect(page).to have_selector('.toots .panel', count: 3)
  end

  scenario "displays list of all toots from all users when logged in" do
    @user.followeds << @second_user
    sign_in(@user)
    visit root_path
   
    expect(page).to have_selector('.toots .panel', count: 3)
  end
 end
