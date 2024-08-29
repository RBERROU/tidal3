require "test_helper"

class PolicyDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get policy_documents_new_url
    assert_response :success
  end

  test "should get create" do
    get policy_documents_create_url
    assert_response :success
  end

  test "should get index" do
    get policy_documents_index_url
    assert_response :success
  end
end
