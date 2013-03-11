# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :integration do
    project nil
    pivotal_id 1
    type ""
    name "MyString"
    field_name "MyString"
    field_label "MyString"
    active false
  end
end
