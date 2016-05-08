require 'spec_helper'

describe "Users Endpoint" do
  it "responds with all users" do
    @user = FactoryGirl.create(:user)
    @second_user = FactoryGirl.create(:user)

    current_session.header "Authorization", "Token token=#{@user.auth_token}"
    get "/api/v1/users", as: :json
    
    expect(last_response.status).to eq(200)
    expect(json["data"].size).to eq(2)
  end
end
