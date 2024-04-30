require "test_helper"

class Api::CoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_courses_index_url
    assert_response :success
  end
end
