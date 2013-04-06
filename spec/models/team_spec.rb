require 'spec_helper'

describe Team do
  
  context "validations" do
    it { should validate_presence_of(:name) }
  end
  
  context "associations" do
    it { should have_many(:projects) }
    it { should have_and_belong_to_many(:users) }
  end
  
  context "initial iterations" do
    
    let!(:team) { FactoryGirl.create(:team) }
    
    it "should create 10 iterations" do
      team.iterations.count.should eq(10)
    end
    
    it "should set the start date" do
      
    end
    
  end

  context "initial story types" do

    let!(:team) { FactoryGirl.create(:team) }

    it "should not be empty" do
      team.story_types.should_not be_empty
    end

  end

  context "initial states" do

    let!(:team) { FactoryGirl.create(:team) }

    it "should not be empty" do
      team.states.should_not be_empty
    end

  end
  
end