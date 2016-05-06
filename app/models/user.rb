class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true, allow_blank: false
  validates :username, presence: true, allow_blank: false
  validates :password, presence: true, allow_blank: false, confirmation: true
  validates :password_confirmation, presence: true
                        
  has_many :toots
  has_many :follower_users, class_name: "Follow", foreign_key: "followed_id"
  has_many :followed_users, class_name: "Follow", foreign_key: "follower_id"
  has_many :followers, through: :follower_users
  has_many :followeds, through: :followed_users
  has_many :favorites

  def following?(other_user)
    self.followeds.include?(other_user)
  end

  def follow!(other_user)
    followeds << other_user
  end

  def unfollow!(other_user)
    followed_users.find_by(followed_id: other_user.id).destroy
  end
end
