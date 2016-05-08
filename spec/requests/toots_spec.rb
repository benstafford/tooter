require 'spec_helper'

describe "Toots Endpoint" do
  it "responds with authorized user's feed of toots" do
    @user = FactoryGirl.create(:user)
    @toot = FactoryGirl.create(:toot, user: @user)
    @second_user = FactoryGirl.create(:user)
    @second_toot = FactoryGirl.create(:toot, user: @second_user)
    @user.followeds << @second_user

    current_session.header "Authorization", "Token token=#{@user.auth_token}"
    get "/api/v1/toots", as: :json
    
    expect(last_response.status).to eq(200)
    expect(json.size).to eq(2)
  end
end
