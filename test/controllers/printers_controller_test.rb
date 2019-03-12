require 'test_helper'

class PrintersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get printers_index_url
    assert_response :success
  end

end
