require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  def setup
    @location = Location.new(name: "Example", latitude: 1.11, longitude: 1.11)
  end

  test "should be valid" do
    assert @location.valid?
  end

  test "name should be present" do
    @location.name = " "
    assert_not @location.valid?
  end

  test "latitude should be present" do
    @location.latitude = " "
    assert_not @location.valid?
  end

  test "longitude should be present" do
    @location.longitude = " "
    assert_not @location.valid?
  end

  test "locations should be unique" do
    duplicate_location = @location.dup
    duplicate_location.latitude = @location.latitude
    duplicate_location.longitude = @location.longitude
    @location.save
    assert_not duplicate_location.valid?
  end

  test "locations should be saved as lowercase" do
    mixed_case_location = "London"
    @location.name = mixed_case_location
    @location.save
    assert_equal mixed_case_location.downcase, @location.reload.name
  end



end
