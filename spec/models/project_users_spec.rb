require 'spec_helper'

describe ProjectUser do
  
  context "validations" do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:role) }
  end
  
  
  context "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:user) }
  end
  
  context "attribute accessible" do
    it { should_not allow_mass_assignment_of :project_id }
    it { should_not allow_mass_assignment_of :user_id }
    it { should allow_mass_assignment_of :role }
  end

end