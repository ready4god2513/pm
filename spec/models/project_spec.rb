require 'spec_helper'

describe Project do
  
  context "validations" do
    it { should validate_presence_of(:team) }
    it { should validate_presence_of(:name) }
  end
  
  
  context "associations" do
    it { should belong_to(:team) }
    it { should have_many(:stories) }
    it { should have_many(:project_users) }
    it { should have_many(:users).through(:project_users) }
  end

  context "attribute accessible" do
    it { should allow_mass_assignment_of :name }
    it { should_not allow_mass_assignment_of :slug }
    it { should_not allow_mass_assignment_of :team }
    it { should_not allow_mass_assignment_of :team_id }
  end
  
end