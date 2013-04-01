# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    story nil
    text "MyText"
    author "MyString"
    commentd_at "2013-03-12 09:46:09"
  end
end
