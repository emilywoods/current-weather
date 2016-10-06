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

  test "should get help" do
    get '/help'
    assert_response :success
    assert_select "title", "Help | Weather App"
  end

  test "should get contact" do
    get '/contact'
    assert_response :success
    assert_select "title", "Contact | Weather App"
  end
end
