require "test_helper"

class ProfessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professions_index_url
    assert_response :success
  end

  test "should get show" do
    get professions_show_url
    assert_response :success
  end
end
