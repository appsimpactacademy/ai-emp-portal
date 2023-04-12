require "application_system_test_case"

class LeaveApplicationsTest < ApplicationSystemTestCase
  setup do
    @leave_application = leave_applications(:one)
  end

  test "visiting the index" do
    visit leave_applications_url
    assert_selector "h1", text: "Leave applications"
  end

  test "should create leave application" do
    visit leave_applications_url
    click_on "New leave application"

    fill_in "Contact", with: @leave_application.contact
    fill_in "Employee", with: @leave_application.employee_id
    fill_in "End date", with: @leave_application.end_date
    check "Is half day" if @leave_application.is_half_day
    fill_in "Leave location", with: @leave_application.leave_location
    fill_in "Leave type", with: @leave_application.leave_type_id
    fill_in "Remarks", with: @leave_application.remarks
    fill_in "Start date", with: @leave_application.start_date
    click_on "Create Leave application"

    assert_text "Leave application was successfully created"
    click_on "Back"
  end

  test "should update Leave application" do
    visit leave_application_url(@leave_application)
    click_on "Edit this leave application", match: :first

    fill_in "Contact", with: @leave_application.contact
    fill_in "Employee", with: @leave_application.employee_id
    fill_in "End date", with: @leave_application.end_date
    check "Is half day" if @leave_application.is_half_day
    fill_in "Leave location", with: @leave_application.leave_location
    fill_in "Leave type", with: @leave_application.leave_type_id
    fill_in "Remarks", with: @leave_application.remarks
    fill_in "Start date", with: @leave_application.start_date
    click_on "Update Leave application"

    assert_text "Leave application was successfully updated"
    click_on "Back"
  end

  test "should destroy Leave application" do
    visit leave_application_url(@leave_application)
    click_on "Destroy this leave application", match: :first

    assert_text "Leave application was successfully destroyed"
  end
end
