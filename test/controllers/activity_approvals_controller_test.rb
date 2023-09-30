require "test_helper"

class ActivityApprovalsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get activity_approvals_create_url
    assert_response :success
  end
end
