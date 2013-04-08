# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "My Project"
    team { FactoryGirl.create(:team) }
  end
end
