# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    project { FactoryGirl.create(:project) }
    pivotal_id nil
    story_type { FactoryGirl.create(:story_type) }
    state { FactoryGirl.create(:state) }
    url "MyString"
    estimate 1
    description "MyText"
    name "MyString"
    requestor { FactoryGirl.create(:user) }
    owner { FactoryGirl.create(:owner) }
    requested_by "MyString"
    pivotal_created_at "2013-03-11 11:55:23"
    pivotal_accepted_at "2013-03-11 11:55:23"
    labels "MyString"
  end
end
