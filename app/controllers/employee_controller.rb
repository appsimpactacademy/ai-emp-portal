class EmployeeController < ApplicationController
  before_action :authenticate_employee!
end