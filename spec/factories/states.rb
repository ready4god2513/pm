# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :state do
    team { FactoryGirl.create(:team) }
    sequence(:name) { |n| "My State #{n}"}
    sequence(:sort_order) { |n| n }
  end
end
