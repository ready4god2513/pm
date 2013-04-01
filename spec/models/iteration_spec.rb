require 'spec_helper'

describe Iteration do
  
  context "validations" do
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
  end
  
  
  context "associations" do
    it { should have_many(:stories) }
  end
  
end