#this may not be the correct way to generate FactoryGirl objects...still in progress

FactoryGirl.define do

  factory :user do |f|
    f.name "my_username"
    f.email { Faker::Internet.safe_email }
    f.password { Faker::Internet.password }
  end

  factory :question do |f|
    f.title { Faker::Lorem.sentence }
    f.content { Faker::Lorem.paragraph }
  end

  factory :answer do |f|
    f.content { Faker::Lorem.paragraph }
  end

  factory :comment do |f|
    f.content {Faker::Lorem.paragraph}
  end

end

