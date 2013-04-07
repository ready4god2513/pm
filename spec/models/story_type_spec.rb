require 'spec_helper'

describe StoryType do
  context "validations" do
    it { should validate_presence_of(:name) }
  end
  
  context "associations" do
    it { should belong_to(:team) }
  end

  context "attribute accessible" do
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :sort_order }
    it { should allow_mass_assignment_of :hidden }
    it { should allow_mass_assignment_of :estimatable }
    it { should_not allow_mass_assignment_of :slug }
    it { should_not allow_mass_assignment_of :team_id }
  end
end