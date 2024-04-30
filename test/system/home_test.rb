require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  test "visiting Homepage" do
    visit root_url
    assert_selector "h1", text: "Courses"
  end
end
