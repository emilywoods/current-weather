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



  test "latitude should not be too long" do
  #  @location.latitude.to_s.split(".").length()
  #  assert_not @location.valid?
  end

  test "longitude should not be too long" do
  #  @location.longitude.to_s.split(".").length()
  #  assert_not @location.valid?
  end


end
