# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    story { FactoryGirl.create(:story) }
    url "http://google.com"
  end
end
