# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :setting do
    iteration_length 1
    planning_mode "intelligent"
    iteration_start_day "Monday"
    points_per_iteration 1
  end
end
