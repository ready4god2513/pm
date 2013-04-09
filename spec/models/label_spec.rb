require 'spec_helper'

describe Label do
  
  context "attribute accessible" do
    it { should_not allow_mass_assignment_of :labelable_id }
    it { should_not allow_mass_assignment_of :labelable_type }
    it { should_not allow_mass_assignment_of :slug }
    it { should allow_mass_assignment_of :name }    
  end
end
