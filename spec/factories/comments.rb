# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    story { FactoryGirl.create(:story) }
    user { FactoryGirl.create(:user) }
    sequence(:text) { |n| "My Comment #{n}"}
  end
end
