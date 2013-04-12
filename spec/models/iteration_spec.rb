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

      # Here's the story with completion percentage-
      # It will really help a team to learn how they are doing through the iterations
      # But doing these calculations can be expensive CPU wise.  The initial
      # implementation can calculate this in real-time, but we need to add a test to ensure
      # that these numbers are cached and it is a simple read from the cache store.
      context "Estimated completion" do

        it "a float" do
          pending "RYAN- Make this happen."
          iteration.expected_completion_percentage.should be_a(Float)
        end

        it "greater than or equal to 0.00" do
          pending "RYAN- Make this happen."
          iteration.expected_completion_percentage.should >= 0.00
        end

        it "less than or equal to 100.00" do
          pending "RYAN- Make this happen."
          iteration.expected_completion_percentage.should <= 100.00
        end

        it "should be a call out to cache once the cache has been warmed" do
          pending "Need to implement this as a call to redis or other cache store."
        end

      end

      it "completed type" do
        iteration.points_completed.should be_a(Fixnum)
      end

      it "completed count" do
        iteration.points_completed.should == story.estimate
      end

    end

  end

end
