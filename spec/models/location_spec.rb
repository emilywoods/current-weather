require 'spec_helper'

describe Location do

  before { @location = Location.new(name: "Example", latitude: 11.11, longitude: 11.11) }

  subject { @location }

  it { should respond_to(:name) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }

  it { should be valid }

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


end
