require 'spec_helper'

describe ProjectUser do
  
  context "validations" do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:role) }
  end
  
  
  context "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:user) }
  end
  
end