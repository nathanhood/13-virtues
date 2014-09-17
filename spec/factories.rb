FactoryGirl.define do
  factory :user do
    email "test@mail.com"
    password "foobar11"
    password_confirmation "foobar11"
  end

  factory :virtue do
    name "test virtue"
  end

  factory :commitment do
    description "test description and stuff"
    user
    virtue
  end
end
