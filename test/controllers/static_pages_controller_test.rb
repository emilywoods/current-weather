require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Weather App"
  end

  test "should get root" do
    get root_path
    assert_response :success
  end

  test "should get home" do
    get '/home'
    assert_response :success
    assert_select "title", "Weather App"
  end

end
