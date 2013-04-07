require 'spec_helper'

describe Setting do

  let(:team) { FactoryGirl.create(:team) }
  let(:setting) { team.setting }

	it "should update iterations when iteration lengths are changed" do
    setting.iteration_length = setting.iteration_length + 1
    setting.save!

    team.iterations.last.length.should == ((setting.iteration_length * 7) - 1)
	end

  it "should update iteration start date" do
    previous_day = setting.iteration_start_day
    new_day = "Tuesday"
    setting.iteration_start_day = new_day
    setting.save!

    team.iterations.future.select { |i| i.start.strftime("%A") == new_day }.count.should == team.iterations.future.count
    team.iterations.future.select { |i| i.start.strftime("%A") == previous_day }.count.should == 0
  end
  
  context "attribute accessible" do
    it { should_not allow_mass_assignment_of :team_id }
    it { should allow_mass_assignment_of :iteration_length }
    it { should allow_mass_assignment_of :iteration_start_day }
    it { should allow_mass_assignment_of :planning_mode }
    it { should allow_mass_assignment_of :points_per_iteration }
  end

end