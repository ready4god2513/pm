require 'spec_helper'

describe Integration do
  
  context "validations" do
    it { should validate_presence_of(:pivotal_id) }
    it { should validate_presence_of(:project) }
  end
  
  
  context "associations" do
    it { should belong_to(:project) }
  end
  
end