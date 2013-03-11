require 'spec_helper'

describe Iteration do
  
  context "validations" do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:pivotal_id) }
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
  end
  
  
  context "associations" do
    it { should belong_to(:project) }
    it { should have_many(:stories) }
  end
  
end