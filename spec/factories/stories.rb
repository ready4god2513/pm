# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    project { FactoryGirl.create(:project) }
    story_type { FactoryGirl.create(:story_type) }
    state { FactoryGirl.create(:state) }
    estimate 1
    description "MyText"
    name "MyString"
    requestor { FactoryGirl.create(:user) }
    owner { FactoryGirl.create(:owner) }
    labels "MyString"
  end
end
