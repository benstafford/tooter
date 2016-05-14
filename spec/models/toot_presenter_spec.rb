require 'spec_helper'

describe TootPresenter do
  describe '#body_with_links' do
    it "should create links to mentioned users" do
      user = FactoryGirl.create(:user)
      toot = FactoryGirl.create(:toot, body: "A user is @#{user.username} mentioned")

      presenter = TootPresenter.new(toot)

      expect(presenter.body_with_links).to include("users/#{user.id}")
    end
  end
end
