require 'spec_helper'

describe "User Endpoint (show)" do
  it "responds with a single user" do
    @user = FactoryGirl.create(:user)

    current_session.header "Authorization", "Token token=#{@user.auth_token}"
    get "/api/v1/users/#{@user.id}", as: :json
    
    expect(last_response.status).to eq(200)
    expect(json["data"]["attributes"]["first-name"]).to eq(@user.first_name)
  end
end
