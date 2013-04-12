require 'spec_helper'

describe Iteration do

  let(:team) { FactoryGirl.create(:team) }
  let(:iteration) { team.iterations.first }
  let(:project) { FactoryGirl.create(:project, team: team) }
  let!(:story) { FactoryGirl.create(:story, iteration: iteration, estimate: 4, completed: true, project: project, state: team.states.last) }

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

        before(:each) { Delorean.time_travel_to (iteration.start + 2.days)}
        after(:each) { Delorean.back_to_the_present }

        it "a float" do
          iteration.expected_completion_percentage.should be_a(Float)
        end

        it "greater than or equal to 0.00" do
          Iteration.any_instance.stub(:points_started_or_completed).and_return(-10)
          Iteration.any_instance.stub(:current_day_num).and_return(13)
          Iteration.any_instance.stub(:length).and_return(13)
          Iteration.any_instance.stub(:total_points).and_return(100)
          
          iteration.expected_completion_percentage.should >= 0.00
        end

        it "less than or equal to 100.00" do
          Iteration.any_instance.stub(:points_started_or_completed).and_return(10)
          Iteration.any_instance.stub(:current_day_num).and_return(2)
          Iteration.any_instance.stub(:length).and_return(13)
          Iteration.any_instance.stub(:total_points).and_return(10)
          
          iteration.expected_completion_percentage.should <= 100.00
        end
        
        it "calculates the correct completion percentage" do
          Iteration.any_instance.stub(:points_started_or_completed).and_return(10)
          Iteration.any_instance.stub(:current_day_num).and_return(2)
          Iteration.any_instance.stub(:length).and_return(13)
          Iteration.any_instance.stub(:total_points).and_return(100)
          
          pending
        end
        
        it "calculate total iteration points" do
          sum = iteration.stories.inject(0) { |sum, story| sum + story.estimate }
          sum.should == iteration.total_points
        end

        it "total points should not be cached" do
          Rails.cache.fetch(iteration: iteration, total_points: true).should be_empty
        end


        it "total points should be cached" do
          sum = iteration.stories.inject(0) { |sum, story| sum + story.estimate }
          total = iteration.total_points

          Rails.cache.fetch(iteration: iteration, total_points: true).should eq(total)
          Rails.cache.fetch(iteration: iteration, total_points: true).should eq(sum)
        end
        
        it "calculate points started or completed" do
          sum = 0
          iteration.stories.each do |story|
            sum += story.estimate if story.started_or_completed?
          end

          sum.should == iteration.points_started_or_completed
        end
        
        it "calculate current day as a num" do
          iteration.current_day_num.should be_a(Fixnum)
        end

        it "calculate current day correctly" do
          # This comes from moving forward 2 days with delorean.  Probably
          # should find a better way to do this.
          iteration.current_day_num.should == 2
        end

        it "should not be in cache" do
          Rails.cache.fetch(iteration: iteration, points_started_or_completed: true).should be_empty
        end

        it "should be cached" do
          points = iteration.points_started_or_completed
          Rails.cache.fetch(iteration: iteration, points_started_or_completed: true).should eq(points)
        end

        it "should clear the cache when stories are modified" do
          pending "Clear cache when story modified"
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
