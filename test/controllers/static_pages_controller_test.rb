require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get contact_page" do
    get :contact_page
    assert_response :success
  end

  test "should get weather_page" do
    get :weather_page
    assert_response :success
  end

end
