require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference("Employee.count") do
      post employees_url, params: { employee: { address_line_1: @employee.address_line_1, address_line_2: @employee.address_line_2, city: @employee.city, country: @employee.country, date_of_birth: @employee.date_of_birth, date_of_joining: @employee.date_of_joining, email: @employee.email, employee_code: @employee.employee_code, first_name: @employee.first_name, gender: @employee.gender, last_name: @employee.last_name, middle_name: @employee.middle_name, pincode: @employee.pincode, primary_contact: @employee.primary_contact, secondary_contact: @employee.secondary_contact, state: @employee.state, title: @employee.title } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { address_line_1: @employee.address_line_1, address_line_2: @employee.address_line_2, city: @employee.city, country: @employee.country, date_of_birth: @employee.date_of_birth, date_of_joining: @employee.date_of_joining, email: @employee.email, employee_code: @employee.employee_code, first_name: @employee.first_name, gender: @employee.gender, last_name: @employee.last_name, middle_name: @employee.middle_name, pincode: @employee.pincode, primary_contact: @employee.primary_contact, secondary_contact: @employee.secondary_contact, state: @employee.state, title: @employee.title } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference("Employee.count", -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
