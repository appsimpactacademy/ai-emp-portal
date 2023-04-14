class AdminController < ApplicationController
  before_action :authenticate_employee!

  rescue_from CanCan::AccessDenied do |exception|
    render json: { warning: exception, status: 'authorization_failed' }
  end
end