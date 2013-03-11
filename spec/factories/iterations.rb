# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :iteration do
    pivotal_id 1
    start "2013-03-11 11:57:42"
    finish "2013-03-11 11:57:42"
    team_strength 1.5
  end
end
