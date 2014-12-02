require 'faker'
FactoryGirl.define do
  factory :player do 
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    score {Faker::Number.digit.to_i}
  end
end