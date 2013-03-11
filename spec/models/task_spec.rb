require 'spec_helper'

describe Task do
  
  context "validations" do
    it { should validate_presence_of(:story) }
    it { should validate_presence_of(:pivotal_id) }
  end
  
  
  context "associations" do
    it { should belong_to(:story) }
  end
  
end