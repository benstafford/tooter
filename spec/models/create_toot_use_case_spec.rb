require 'spec_helper'

describe 'CreateTootUseCase' do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe '.run' do
    it "creates a toot with valid arguments" do
      params = FactoryGirl.attributes_for(:toot)
      expect{CreateTootUseCase.run(@user, params)}.to change{Toot.count}.by(1)
    end

    it "creates a mention if a user is mentioned" do
      @second_user = FactoryGirl.create(:user, username: "ann")
      params = FactoryGirl.attributes_for(:toot, body: "This is a @#{@second_user.username} mention")

      toot = CreateTootUseCase.run(@user, params)
      expect(@second_user.mentions.count).to eq(1)
    end

    it "creates a mention for each mentioned user" do
      @second_user = FactoryGirl.create(:user, username: "ann")
      @third_user = FactoryGirl.create(:user, username: "bob") 
      params = FactoryGirl.attributes_for(:toot, body: "This is a @#{@second_user.username} @#{@third_user.username} mention")

      expect {
        @toot = CreateTootUseCase.run(@user, params)
      }.to change{Mention.count}.by(2)
      expect(@second_user.mentions.first.toot).to eq(@toot)
      expect(@third_user.mentions.first.toot).to eq(@toot)
    end
  end
end
