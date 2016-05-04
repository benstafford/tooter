require 'spec_helper'

feature "Navigation" do
  before do
    @user = FactoryGirl.create(:user)
    @toot = FactoryGirl.create(:toot, user: @user)
    @other_user = FactoryGirl.create(:user, first_name: "Follower")
    @other_toot = FactoryGirl.create(:toot, user: @other_user)
    sign_in(@user)
  end

  scenario "should have a link to view Sniffers (followers)" do
    visit user_path(@user)
    @user.followers << @other_user 
    
    click_link "Sniffers"

    expect(page).to have_css('.followers li', text: @other_user.first_name)
  end

  scenario "should have a link to view list of users that a user is Smelling (following)" do
    visit user_path(@user)
    @user.followeds << @other_user

    click_link "Smelling"

    expect(page).to have_css('.following li', text: @other_user.first_name)
  end
end
