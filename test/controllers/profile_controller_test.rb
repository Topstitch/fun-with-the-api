require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get repositories" do
    get :repositories
    assert_response :success
  end

end
