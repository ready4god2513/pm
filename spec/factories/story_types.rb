# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story_type do
    team { FactoryGirl.create(:team) }
    sequence(:name) { |n| "My Story Type #{n}"}
    sequence(:sort_order) { |n| n }
    estimatable true
  end
end
