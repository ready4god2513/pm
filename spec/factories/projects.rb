# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    sequence(:name) {|n| "My Project #{n}" }
    team { FactoryGirl.create(:team) }
  end
end
