require 'spec_helper'

describe User do
  
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
  
  
  context "associations" do
    it { should have_many(:project_users) }
    it { should have_many(:projects).through(:project_users) }
  end
  
  context "attribute accessible" do
    it { should_not allow_mass_assignment_of :slug }
    it { should_not allow_mass_assignment_of :encrypted_password }
    it { should_not allow_mass_assignment_of :reset_password_token }
    it { should_not allow_mass_assignment_of :reset_password_sent_at }
    it { should_not allow_mass_assignment_of :remember_created_at }
    it { should_not allow_mass_assignment_of :sign_in_count }
    it { should_not allow_mass_assignment_of :current_sign_in_at }
    it { should_not allow_mass_assignment_of :last_sign_in_at }
    it { should_not allow_mass_assignment_of :current_sign_in_ip }
    it { should_not allow_mass_assignment_of :last_sign_in_ip }
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :email }
    it { should allow_mass_assignment_of :color }
    it { should allow_mass_assignment_of :hidden }
    
  end

end
