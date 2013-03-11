# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_user do
    project nil
    user nil
    role "MyString"
  end
end
