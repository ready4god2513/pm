# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    sequence(:name) { |n| "My Team #{n}" }
    sequence(:key) { |n| "#{SecureRandom.hex}-#{n}"}
    setting { FactoryGirl.create(:setting) }
    users { [FactoryGirl.create(:user), FactoryGirl.create(:user)]}
  end
end
