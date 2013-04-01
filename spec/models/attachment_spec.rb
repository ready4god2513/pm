require 'spec_helper'

describe Attachment do
  
  context "validations" do
    it { should validate_presence_of(:attachable) }
  end
  
  
  context "associations" do
    it { should belong_to(:attachable) }
  end
  
end
