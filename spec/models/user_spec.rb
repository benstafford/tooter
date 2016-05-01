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
end
