# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    story nil
    # pivotal_id 1
    description "MyText"
    position 1
    complete false
    pivotal_created_at "2013-03-11 11:56:11"
  end
end
