require 'spec_helper'

describe "Toot create" do
  it "creates a new toot with valid attributes" do
    @user = FactoryGirl.create(:user)
    current_session.header "Authorization", "Token token=#{@user.auth_token}"

    post "/api/v1/toots", as: :json, toot: { body: "A toot from the API" }

    expect(json["data"]["attributes"]["body"]).to eq("A toot from the API")
    expect(json["data"]["relationships"]["user"]["data"]["id"]).to eq(@user.id.to_json)
  end
end
