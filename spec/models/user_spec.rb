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
  
  context "relationships" do
    before do
      @user = FactoryGirl.create(:user)
      @target_user = FactoryGirl.create(:user)
    end

    describe "#follow!" do
      it "should create a follower relationship" do
        @user.follow!(@target_user)
        expect(@user.followeds).to include(@target_user)
      end
    end

    describe "#unfollow!" do
      it "should remove followed relationship" do
        @user.followeds << @target_user
        @user.unfollow!(@target_user)
        @user.followeds.reload
        expect(@user.followeds).to_not include(@target_user)
      end
    end
  end
end
