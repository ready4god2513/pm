# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :iteration do
    start { 1.week.ago }
    finish { 1.week.from_now }
    status "current"
  end
end
