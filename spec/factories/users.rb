# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "My User #{n}" }
    
    sequence(:email) { |n| "user#{n}@weareusers.com" }
    password "mypassword"
    color "#222"
  end
end
