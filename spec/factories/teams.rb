# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name "My Team"
    sequence(:key) { |n| "#{SecureRandom.hex}-#{n}"}
    setting { FactoryGirl.create(:setting) }
  end
end
