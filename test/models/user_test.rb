require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @jua = users(:jua)
    @jane = users(:jane)
  end

  test "name must be unique" do
    @jane.name = "Chokchai"
    @jane.save

    assert_equal false, @jane.valid?
  end
end
