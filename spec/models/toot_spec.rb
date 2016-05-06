require 'spec_helper'

describe 'Toot' do
  before do
    @user = FactoryGirl.create(:user)
    @toot = FactoryGirl.create(:toot, user: @user)
  end

  describe 'validations' do
    it "should be valid for factory object" do
      expect(@toot.valid?).to be true
    end

    it "should be invalid without text" do
      @toot.body = ""
      expect(@toot.valid?).to be false
    end
    
    it "should be invalid without user_id" do
      @toot.user_id = ""
      expect(@toot.valid?).to be false
    end
  end

  describe '#favorite_for' do
    it "returns true if supplied user argument has favorited the toot" do
      @toot.favorites.create(user: @user)
      expect(@toot.favorite_for?(@user)).to be true
    end

    it "returns false if supplied user argument has not favorited the toot" do
      expect(@toot.favorite_for?(@user)).to be false
    end
  end

  describe '#favorite_count' do
    it "returns count of times a toot has been favorited" do
      expect(@toot.favorite_count).to eq(0)
      @toot.favorites.create(user: @user)
      expect(@toot.favorite_count).to eq(1)
    end
  end
end
