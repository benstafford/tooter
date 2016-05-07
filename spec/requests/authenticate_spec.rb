require 'spec_helper'

describe "Authentication" do
  before do
    @user = FactoryGirl.create(:user)
  end

  context "successful" do
    before do 
      authorize(@user.username, @user.password)
      post "/api/v1/login"
    end

    it "responds with success status" do
      expect(last_response.status).to eq(200)
    end

    it "responds with token" do
      expect(json["auth_token"]).to eq(@user.auth_token)
    end
  end

  context "unsuccessfully" do
    before { post "/api/v1/login", user: { username: "doesntexist", password: "doesntwork" } }
    it "responds with a 401 status" do
      expect(last_response.status).to eq(401) 
    end
  end
end
