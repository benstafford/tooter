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
end
