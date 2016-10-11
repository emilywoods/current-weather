require 'spec_helper'

describe 'Location pages' do

  subject { page }

  describe "locations page" do
    before { visit '/locations' }

    it { should have_content('Weather App')}
    it { should have_title('All locations | Weather App')}
  end

  describe "new location" do
    before { visit'/locations/new'}

    let(:submit) { "Create" }

    describe "with invalid information" do
      it "should not create a new location" do
        expect { click_button submit }.not_to change(Location, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",           with: "Example Location"
        fill_in "Latitude",       with: "1.111"
        fill_in "Longitude",      with: "1.111"
      end

      it "should create a new location" do
        expect { click_button submit }.to change(Location, :count).by(1)
      end
    end

  end


end
