require 'spec_helper'

describe Attachment do
  
  context "validations" do
    it { should validate_presence_of(:story) }
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url).scoped_to(:story_id) }
  end
  
  
  context "associations" do
    it { should belong_to(:story) }
  end
  
end
