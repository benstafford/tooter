class Toot < ActiveRecord::Base
  belongs_to :user
  has_many :favorites

  validates :body, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  def favorite_for?(user)
    if favorites.find_by(user_id: user.id)
      true
    else
      false
    end
  end

  def favorite_count
    favorites.size
  end
end
