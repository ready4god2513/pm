require 'spec_helper'

describe Team do

  let!(:team) { FactoryGirl.create(:team) }

  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "associations" do
    it { should have_many(:projects) }
    it { should have_and_belong_to_many(:users) }
  end

  context "attribute accessible" do
    it { should_not allow_mass_assignment_of :slug }
    it { should_not allow_mass_assignment_of :key }
    it { should allow_mass_assignment_of :name }
  end

  context "initial iterations" do

    it "should create 10 iterations" do
      team.iterations.count.should eq(10)
    end

    it "should set the start date" do

    end

  end

  context "initial story types" do

    it "should not be empty" do
      team.story_types.should_not be_empty
    end

  end

  context "initial states" do

    it "should not be empty" do
      team.states.should_not be_empty
    end

  end


  context "reports" do

    context "points" do

      # This test isn't all that necessary, but with red/green rinse and repeat
      # this made sense
      it "is float" do
        team.average_points_completed.should be_a(Float)
      end

      it "is 0 when nothing completed" do
        team.average_points_completed.should == 0.to_f
      end

      it "calculates" do
        
      end

      it "shows progress" do
        
      end

    end

  end

end
