require 'spec_helper'

describe Attachment do
  
  context "validations" do
    it { should validate_presence_of(:attachable) }
  end
  
  
  context "associations" do
    it { should belong_to(:attachable) }
    it { should belong_to(:uploader)}
  end
  
  context "attribute accessible" do
    it { should_not allow_mass_assignment_of :attachable_id }
    it { should_not allow_mass_assignment_of :uploader_id }
    it { should_not allow_mass_assignment_of :attachable_type }
    it { should allow_mass_assignment_of :file }
  end
  
end