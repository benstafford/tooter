class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true, allow_blank: false
  validates :username, presence: true, allow_blank: false
  validates :password, presence: true, allow_blank: false, confirmation: true
  validates :password_confirmation, presence: true
                        
  has_many :toots
end
