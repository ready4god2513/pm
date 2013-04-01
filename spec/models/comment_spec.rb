require 'spec_helper'

describe Comment do
  
  context "validations" do
    it { should validate_presence_of(:story) }
  end
  
  
  context "associations" do
    it { should belong_to(:story) }
  end
  
end