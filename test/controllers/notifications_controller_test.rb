require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  test "should get receiver" do
    get :receiver
    assert_response :success
  end

  test "should get sender" do
    get :sender
    assert_response :success
  end

end
