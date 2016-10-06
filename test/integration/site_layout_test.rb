require 'test_helper'

class SiteLayoutRest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", locations_path
    assert_select "a[href=?]", contact_path

  end
end
