require "test_helper"

class LeaveTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @leave_type = leave_types(:one)
  end

  test "should get index" do
    get leave_types_url
    assert_response :success
  end

  test "should get new" do
    get new_leave_type_url
    assert_response :success
  end

  test "should create leave_type" do
    assert_difference("LeaveType.count") do
      post leave_types_url, params: { leave_type: { description: @leave_type.description, name: @leave_type.name } }
    end

    assert_redirected_to leave_type_url(LeaveType.last)
  end

  test "should show leave_type" do
    get leave_type_url(@leave_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_leave_type_url(@leave_type)
    assert_response :success
  end

  test "should update leave_type" do
    patch leave_type_url(@leave_type), params: { leave_type: { description: @leave_type.description, name: @leave_type.name } }
    assert_redirected_to leave_type_url(@leave_type)
  end

  test "should destroy leave_type" do
    assert_difference("LeaveType.count", -1) do
      delete leave_type_url(@leave_type)
    end

    assert_redirected_to leave_types_url
  end
end
