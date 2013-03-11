# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_membership do
    project nil
    pivotal_id 1
    name "MyString"
    email "MyString"
    initials "MyString"
    role "MyString"
  end
end
