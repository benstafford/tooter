class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :toot

  validates :user_id, presence: true
  validates :toot_id, presence: true
end
