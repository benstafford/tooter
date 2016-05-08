class Toot < ActiveRecord::Base
  belongs_to :user
  has_many :favorites

  validates :body, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  scope :ordered, lambda { order("created_at desc") }
  
  def self.all_ordered
    Toot.all.ordered
  end

  def self.only_for(user)
    Toot.where(user: user).ordered
  end

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
