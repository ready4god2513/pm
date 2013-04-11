# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    story { FactoryGirl.create(:story) }
    sequence(:description) { |n| "My Task #{n}" }
    sequence(:position) { |n| n }
    complete false
  end
end
