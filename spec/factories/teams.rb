# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name "My Team"
    key "My Key"
    setting { FactoryGirl.create(:setting) }
  end
end
