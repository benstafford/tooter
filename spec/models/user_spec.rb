require 'spec_helper'

describe 'User' do
  before { @user = FactoryGirl.build(:user) }

  describe 'validations' do
    it "should be valid for factory object" do
      expect(@user.valid?).to be true
    end
    
    context "should be invalid" do
      it "when first_name is missing" do
        @user.first_name = nil
        expect(@user.valid?).to be false 
      end

      it "when username is missing" do
        @user.username = nil
        expect(@user.valid?).to be false
      end

      it "when password is missing" do
        @user.password = nil
        expect(@user.valid?).to be false
      end
    end
  end

  describe "#following?" do
    before { @followed_user = FactoryGirl.create(:user) }

    it "should return true if instance is following supplied user" do
      @user.followeds << @followed_user
      expect(@user.following?(@followed_user)).to be true
    end

    it "should return false if user instance is not following supplied user" do
      expect(@user.following?(@follower_user)).to be false
    end
  end

  describe "#unfollow!" do
    before do
      @user = FactoryGirl.create(:user)
      @followed_user = FactoryGirl.create(:user)
      @user.followeds << @followed_user
    end

    it "should remove followed relationship" do
      @user.unfollow!(@followed_user)
      expect(@user.followeds).to_not include(@follower_user)
    end
  end
end
