FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "user#{n}" }
    sequence(:email) {|n| "email#{n}@gmail.com" }
    password "password"
  end

  factory :question do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
end