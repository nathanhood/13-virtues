FactoryGirl.define do
  sequence :name do |n|
    "test virtue #{n}"
  end

# FactoryGirl.define do
  factory :user do
    email "test@mail.com"
    password "foobar11"
    password_confirmation "foobar11"
  end

  factory :virtue do
    name { generate(:name) }
  end

  factory :commitment do
    description "test description and stuff"
    user
    virtue
  end
end
