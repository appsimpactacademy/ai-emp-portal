class Admin::LeaveApplicationsController < AdminController
  # load_and_authorize_resource
  before_action :set_leave_application, only: %i[ show edit update destroy update_status ]

  def current_ability
    @current_ability ||= ::Ability.new(current_employee)
  end

  def index
    @leave_applications = LeaveApplication.all.page(params[:page])
  end

  def show
    @leave_summary = @leave_application.employee.current_leave_summary
  end

  def new
    @leave_application = LeaveApplication.new
  end

  def edit
  end

  def create
    @leave_application = LeaveApplication.new(leave_application_params)

    respond_to do |format|
      if @leave_application.save
        format.html { redirect_to admin_leave_application_path(@leave_application), notice: "Leave application was successfully created." }
        format.json { render :show, status: :created, location: @leave_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @leave_application.update(leave_application_params)
        format.html { redirect_to admin_leave_application_path(@leave_application), notice: "Leave application was successfully updated." }
        format.json { render :show, status: :ok, location: @leave_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    @leave_application.status = params[:leave_application][:status].downcase
    @leave_application.reason_for_status_change = params[:leave_application][:reason_for_status_change]
    @leave_application.save(validate: false)
    LeaveApplicationMailer.admin_change_leave_application_status(@leave_application, params[:leave_application][:status]).deliver_now
    redirect_to admin_leave_application_path(@leave_application), notice: "Leave status has been updated successfully, will be notified to respective employee via email."
  end

  def destroy
    @leave_application.destroy

    respond_to do |format|
      format.html { redirect_to admin_leave_applications_url, notice: "Leave application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_leave_application
    @leave_application = LeaveApplication.find(params[:id])
  end

  def leave_application_params
    params.require(:leave_application).permit(:employee_id, :leave_type_id, :start_date, :end_date, :is_half_day, :leave_location, :contact, :remarks)
  end
end
