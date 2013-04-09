require 'spec_helper'

describe Iteration do

  let(:team) { FactoryGirl.create(:team) }
  let(:iteration) { team.iterations.first }
  let(:project) { FactoryGirl.create(:project, team: team) }
  let!(:story) { FactoryGirl.create(:story, iteration: iteration, estimate: 4, completed: true, project: project) }

  context "validations" do
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
  end


  context "associations" do
    it { should belong_to(:team) }
    it { should have_many(:stories) }
  end

  context "mass assignment" do
    it { should_not allow_mass_assignment_of :team_id }
    it { should allow_mass_assignment_of :start }
    it { should allow_mass_assignment_of :finish }
    it { should allow_mass_assignment_of :status }
  end

  context "reports" do

    context "points" do

      it "completed type" do
        iteration.points_completed.should be_a(Fixnum)
      end

      it "completed count" do
        iteration.points_completed.should == story.estimate
      end

    end

  end

end
