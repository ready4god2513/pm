require 'spec_helper'

describe Story do
  
  context "validations" do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:name) }
  end
  
  
  context "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:state) }
    it { should belong_to(:story_type) }
    it { should belong_to(:iteration) }
    it { should have_many(:tasks) }
    it { should have_many(:attachments) }
    it { should have_many(:comments) }
  end
  
end
