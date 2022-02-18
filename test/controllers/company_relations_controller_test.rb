require "test_helper"

class CompanyRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get company_relations_show_url
    assert_response :success
  end
end
