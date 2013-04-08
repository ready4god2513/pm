# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :story do
    project { FactoryGirl.create(:project) }
    story_type { FactoryGirl.create(:story_type) }
    state { FactoryGirl.create(:state) }
    estimate 1
    description "Story Description"
    name "My New Story"
    managers { [FactoryGirl.create(:user)] }
    developers { [FactoryGirl.create(:user)] }
    labels { [FactoryGirl.create(:label)] }
    iteration { FactoryGirl.create(:iteration) }
    completed false
  end
end
