require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,  "Weather App"
    assert_equal full_title("Help"),  "Help | Weather App"
    assert_equal full_title("Contact"),  "Contact | Weather App"
    assert_equal full_title("Locations"),  "Locations | Weather App"
  end
end
