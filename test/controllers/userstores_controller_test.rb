require 'test_helper'

class UserstoresControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get userstores_destroy_url
    assert_response :success
  end

end
