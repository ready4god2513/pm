require 'spec_helper'

describe Setting do

  let(:team) { FactoryGirl.create(:team) }
  let(:setting) { team.setting }

	it "should update iterations when iteration lengths are changed" do
    setting.iteration_length = setting.iteration_length + 1
    setting.save!

    team.iterations.last.length.should == ((setting.iteration_length * 7) - 1)
	end

end