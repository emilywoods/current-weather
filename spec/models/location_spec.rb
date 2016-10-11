require 'spec_helper'


describe Location do

  before { @location = Location.new(name: "Example", latitude: 11.11, longitude: 11.11) }

  subject { @location }

  it { should respond_to(:name) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }

  it { should be_valid }

  describe "when name is not present" do
    before { @location.name = " " }
    it { should_not be_valid }
  end

  describe "when latitude is not present" do
    before { @location.latitude = " " }
    it { should_not be_valid }
  end

  describe "when longitude is not present" do
    before { @location.longitude = " " }
    it { should_not be_valid }
  end

  describe "location is already saved" do
    before do
      location_with_same_coordinates = @location.dup
      location_with_same_coordinates.save
    end

    it { should_not be_valid }
  end

  describe "name is too long" do
    before { @location.name = "a"*71 }
    it { should_not be_valid }
  end

  describe "location name with mixed case" do
    let(:mixed_case_name) { "LonDON" }

    it "location name should be saved as all lower-case" do
      @location.name = mixed_case_name
      @location.save
      expect(@location.reload.name).to eq mixed_case_name.downcase
    end
  end
end
