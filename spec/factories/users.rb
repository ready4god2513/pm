# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "My User"
    sequence(:email) { |n| "user#{n}@weareusers.com" }
    password "mypassword"
    color "#222"
  end
end
