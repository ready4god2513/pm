require 'spec_helper'

describe Project do
  
  context "validations" do
    it { should validate_presence_of(:team) }
    it { should validate_presence_of(:name) }
  end
  
  
  context "associations" do
    it { should belong_to(:team) }
    it { should have_many(:iterations) }
    it { should have_many(:stories) }
    it { should have_many(:iteration_stories).through(:iterations) }
    it { should have_many(:project_users) }
    it { should have_many(:users).through(:project_users) }
  end
  
end