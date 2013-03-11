# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_user, :class => 'ProjectUsers' do
    project nil
    user nil
    role "MyString"
  end
end
