# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    project nil
    pivotal_id nil
    story_type "MyString"
    url "MyString"
    estimate 1
    current_state "MyString"
    description "MyText"
    name "MyString"
    requested_by "MyString"
    owned_by "MyString"
    pivotal_created_at "2013-03-11 11:55:23"
    pivotal_accepted_at "2013-03-11 11:55:23"
    labels "MyString"
  end
end
