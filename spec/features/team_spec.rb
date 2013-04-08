require "spec_helper"

describe Team do

  context "Sign Up" do

    it "redirect to new subdomain" do
      # to find out what routes are available, run "rake routes" from the command line
      visit root_path

      # See https://github.com/jnicklas/capybara for API on interacting with the page
      fill_in "team_name", with: "My Team" 
      fill_in "team_setting_attributes_points_per_iteration", with: 10
      click_button "Sign Up Now"

      # Check that we have redirected to the subdomain of the new team
      page.current_url.should =~ /#{Team.first.slug}/
    end

  end

end