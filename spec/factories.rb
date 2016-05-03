FactoryGirl.define do
  factory :follow do
    follower_id 1
    followed_id 1
  end
  factory :user do
    first_name "Pepe"
    username "pepe"
    password "mypassword"
    password_confirmation "mypassword"
  end

  factory :toot do
    body "This is my first toot!"
  end
end
