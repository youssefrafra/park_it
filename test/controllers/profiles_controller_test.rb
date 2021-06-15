require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get my_parkings" do
    get profiles_my_parkings_url
    assert_response :success
  end

  test "should get my_bookings" do
    get profiles_my_bookings_url
    assert_response :success
  end
end
