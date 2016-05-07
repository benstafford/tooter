require 'spec_helper'

describe "Favorites" do
  before do 
    @user = FactoryGirl.create(:user)
    @toot_user = FactoryGirl.create(:user)
    @toot = FactoryGirl.create(:toot, user: @toot_user)
    sign_in(@user)
  end

  scenario "can be created by a user for any toot" do
    visit user_path(@toot_user)

    click_on "Favorite"

    expect(page).to have_content("Favorited!")
  end
end
