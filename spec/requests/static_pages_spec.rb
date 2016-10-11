require 'spec_helper'

describe "Static Pages" do

  subject{ page }

  describe "Home Page" do
    before { visit root_path }

    it { should have_content('Weather App') }
    it { should have_title('Weather App')}
    it { should_not have_title(' | Home') }



    it "should have the right links" do
      expect(page).to have_link("Locations")
      expect(page).to have_link("Home")
      expect(page).to have_link("Get the weather for a new location")
      expect(page).to have_link("See list of locations")

    end
  end
end
