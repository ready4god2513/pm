require 'spec_helper'

describe State do
  pending "add some examples to (or delete) #{__FILE__}"
  
  context "attribute accessible" do
    it { should_not allow_mass_assignment_of :team_id }
    it { should_not allow_mass_assignment_of :slug }
    it { should allow_mass_assignment_of :sort_order }
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :hidden }
  end
  
end
