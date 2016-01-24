#this may not be the correct way to generate FactoryGirl objects...still in progress

FactoryGirl.define do

  factory :question do |f|
    f.title { Faker::Lorem.sentence }
    f.content { Faker::Lorem.paragraph }
    f.user_id { rand(1..10) }
  end

end

