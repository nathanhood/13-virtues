FactoryGirl.define do
  sequence :name do |n|
    "test virtue #{n}"
  end

  factory :user do
    email "test@mail.com"
    password "foobar11"
    password_confirmation "foobar11"
  end

  factory :virtue do
    name { generate(:name) }
    created_at DateTime.now
  end

  factory :commitment do
    description "test description and stuff"
    user
    virtue
  end

  factory :daily_report do
    entry "This is an example daily_report entry"
    created_at DateTime.now
    user
  end

  factory :virtue_report do
    rating 3
    virtue
    daily_report
  end
end
