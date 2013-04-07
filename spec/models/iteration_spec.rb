require 'spec_helper'

describe Iteration do
  
  context "validations" do
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
  end
  
  
  context "associations" do
    it { should have_many(:stories) }
  end
  
  context "mass assignment" do
    it { should_not allow_mass_assignment_of :team_id }
    it { should allow_mass_assignment_of :start }
    it { should allow_mass_assignment_of :finish }
    it { should allow_mass_assignment_of :status }
  end
  
end