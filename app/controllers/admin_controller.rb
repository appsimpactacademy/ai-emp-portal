class AdminController < ApplicationController
  before_action :authenticate_employee!
end