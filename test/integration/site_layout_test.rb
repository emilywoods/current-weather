require 'test_helper'

class SiteLayoutRest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'

  end
end
