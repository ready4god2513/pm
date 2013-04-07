require 'spec_helper'

describe Task do
  
  context "validations" do
    it { should validate_presence_of(:story) }
  end
    
  context "associations" do
    it { should belong_to(:story) }
  end
  
  context "attribute accessible" do
    it { should_not allow_mass_assignment_of :story_id }
    it { should_not allow_mass_assignment_of :owner_id }
    it { should_not allow_mass_assignment_of :requestor_id }
    it { should allow_mass_assignment_of :description }
    it { should allow_mass_assignment_of :position }
    it { should allow_mass_assignment_of :complete }
  end
  
end