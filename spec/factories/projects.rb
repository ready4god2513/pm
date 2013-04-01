# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    # pivotal_id 1
    name "MyString"
    iteration_length 1
    week_start "MyString"
    point_scale "MyString"
    velocity_scheme "MyString"
    current_velocity "MyString"
    initial_velocity "MyString"
    number_of_done_iterations_to_show "MyString"
    labels "MyString"
    allow_attachments "MyString"
    public "MyString"
    use_https "MyString"
    bugs_and_chores_are_estimatable "MyString"
    commit_mode "MyString"
    last_activity_at "MyString"
  end
end
