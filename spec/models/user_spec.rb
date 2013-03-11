require 'spec_helper'

describe User do
  
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:pivotal_id) }
    it { should validate_presence_of(:email) }
  end
  
  
  context "associations" do
    it { should have_many(:project_users) }
    it { should have_many(:projects).through(:project_users) }
  end
  
end
