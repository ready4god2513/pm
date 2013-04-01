# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :setting do
    team nil
    iteration_length 1
    planning_mode "MyString"
    points 1
  end
end
