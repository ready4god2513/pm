require 'spec_helper'

describe Comment do
  
  context "validations" do
    it { should validate_presence_of(:story) }
  end
  
  
  context "associations" do
    it { should belong_to(:story) }
    it { should belong_to(:user) }
  end
  
  context "attribute accessible" do
     it { should_not allow_mass_assignment_of :story_id }
     it { should_not allow_mass_assignment_of :user_id }
     it { should allow_mass_assignment_of :text }
   end
  
end