require 'spec_helper'

describe Story do
  
  context "validations" do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:name) }
  end
  
  
  context "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:state) }
    it { should belong_to(:story_type) }
    it { should belong_to(:iteration) }
    it { should have_many(:tasks) }
    it { should have_many(:attachments) }
    it { should have_many(:comments) }
    it { should respond_to(:has_descendants?) } # Implement nested set.  More tests needed, however
  end

  context "attribute accessible" do
    it { should allow_mass_assignment_of :estimate }
    it { should allow_mass_assignment_of :description }
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :priority }
    it { should_not allow_mass_assignment_of :slug }
    it { should_not allow_mass_assignment_of :project_id }
    it { should_not allow_mass_assignment_of :iteration_id }
    it { should_not allow_mass_assignment_of :story_type_id }
    it { should_not allow_mass_assignment_of :state_id }
  end
  
  context "status" do
    
    let(:team) { FactoryGirl.create(:team) }
    let(:project) { FactoryGirl.create(:project, team: team) }
    let(:story) { FactoryGirl.create(:story, project: project, iteration: team.iterations.first, state: team.states.first) }
    
    it "should be started (started)" do
      story.state = team.states.offset(1).first
      story.save
      
      story.should be_started_or_completed
    end
    
    it "should be started (completed)" do
      story.state = team.states.last
      story.save
      
      story.should be_started_or_completed
    end
    
    it "should not be started" do
      story.state = team.states.first
      story.save
      
      story.should_not be_started_or_completed
    end
    
  end

  context "notifications" do

    let(:story) { FactoryGirl.create(:story) }

    context "created" do

      before(:each) { story }
      
      it "should notify developers" do
        story.developers.each do |developer|
          ActionMailer::Base.deliveries.detect { |d| d.to.include?(developer.email) }.should be_present
        end
      end

    end

  end
  
end
