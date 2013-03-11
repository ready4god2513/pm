require 'spec_helper'
include Warden::Test::Helpers

module RequestHelper
  def create_logged_in_user
    user = FactoryGirl.create(:user)
    login(user)
    user
  end

  def create_logged_in_admin
    user = FactoryGirl.create(:user, :role => "admin")
    login(user)
    user
  end

  def login(user)
    login_as user, scope: :user
  end
end

RSpec.configure do |config|
  config.include RequestHelper, :type => :request
end