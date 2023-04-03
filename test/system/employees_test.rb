require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "should create employee" do
    visit employees_url
    click_on "New employee"

    fill_in "Address line 1", with: @employee.address_line_1
    fill_in "Address line 2", with: @employee.address_line_2
    fill_in "City", with: @employee.city
    fill_in "Country", with: @employee.country
    fill_in "Date of birth", with: @employee.date_of_birth
    fill_in "Date of joining", with: @employee.date_of_joining
    fill_in "Email", with: @employee.email
    fill_in "Employee code", with: @employee.employee_code
    fill_in "First name", with: @employee.first_name
    fill_in "Gender", with: @employee.gender
    fill_in "Last name", with: @employee.last_name
    fill_in "Middle name", with: @employee.middle_name
    fill_in "Pincode", with: @employee.pincode
    fill_in "Primary contact", with: @employee.primary_contact
    fill_in "Secondary contact", with: @employee.secondary_contact
    fill_in "State", with: @employee.state
    fill_in "Title", with: @employee.title
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "should update Employee" do
    visit employee_url(@employee)
    click_on "Edit this employee", match: :first

    fill_in "Address line 1", with: @employee.address_line_1
    fill_in "Address line 2", with: @employee.address_line_2
    fill_in "City", with: @employee.city
    fill_in "Country", with: @employee.country
    fill_in "Date of birth", with: @employee.date_of_birth
    fill_in "Date of joining", with: @employee.date_of_joining
    fill_in "Email", with: @employee.email
    fill_in "Employee code", with: @employee.employee_code
    fill_in "First name", with: @employee.first_name
    fill_in "Gender", with: @employee.gender
    fill_in "Last name", with: @employee.last_name
    fill_in "Middle name", with: @employee.middle_name
    fill_in "Pincode", with: @employee.pincode
    fill_in "Primary contact", with: @employee.primary_contact
    fill_in "Secondary contact", with: @employee.secondary_contact
    fill_in "State", with: @employee.state
    fill_in "Title", with: @employee.title
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee" do
    visit employee_url(@employee)
    click_on "Destroy this employee", match: :first

    assert_text "Employee was successfully destroyed"
  end
end
