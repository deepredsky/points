require "test_helper"

class BulkActivitiesApprovalsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bulk_activities_approvals_create_url
    assert_response :success
  end
end
