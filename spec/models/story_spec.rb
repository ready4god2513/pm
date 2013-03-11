require 'spec_helper'

describe Story do
  
  context "validations" do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:iteration) }
    it { should validate_presence_of(:pivotal_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:current_state) }
  end
  
  
  context "associations" do
    it { should belong_to(:project) }
    it { should belong_to(:iteration) }
    it { should have_many(:tasks) }
    it { should have_many(:attachments) }
  end
  
end
