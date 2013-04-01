require 'spec_helper'

describe Team do
  
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:key) }
    it { should validate_uniqueness_of(:name) }
  end
  
  context "associations" do
    it { should have_many(:projects) }
    it { should have_many(:users) }
  end
  
end