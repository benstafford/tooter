require 'spec_helper'

describe "Authentication" do
  before do
    @user = FactoryGirl.create(:user)
  end

  context "successful" do
    before do 
      authorize(@user.username, @user.password)
      post "/api/v1/login", as: :json
    end

    it "responds with success status" do
      expect(last_response.status).to eq(200)
    end

    it "responds with token" do
      expect(json["data"]["attributes"]["auth-token"]).to eq(@user.auth_token)
    end
  end

  context "unsuccessfully" do
    before { post "/api/v1/login", as: :json, user: { username: "doesntexist", password: "doesntwork" } }
    it "responds with a 401 status" do
      expect(last_response.status).to eq(401) 
    end
  end

  context "with an auth token" do
    before do
      authorize(@user.username, @user.password)
      post "/api/v1/login", as: :json
      @auth_token = json["data"]["attributes"]["auth-token"]
    end

    it "responds with a status of 200 when token supplied" do
      current_session.header "Authorization", "Token token=#{@auth_token}"
      get "/api/v1/toots", as: :json 
      expect(last_response.status).to eq(200)
    end

    it "responds with a status of 401 without a token" do
      get "/api/v1/toots", as: :json
      expect(last_response.status).to eq(401)
    end

    it "respods with a status of 401 with the wrong token" do
      current_session.header "Authorization", "Token token=wrongtoken"
      get "/api/v1/toots", as: :json
      expect(last_response.status).to eq(401)
    end
  end
end
