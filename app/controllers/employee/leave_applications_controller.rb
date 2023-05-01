class Employee::LeaveApplicationsController < EmployeeController
  before_action :set_leave_application, only: %i[ show edit update destroy ]

  # GET /leave_applications or /leave_applications.json
  
  def index
    @leave_applications = Employee.includes(:leave_applications).find(current_employee.id).leave_applications
  end

  # GET /leave_applications/1 or /leave_applications/1.json
  def show
  end

  # GET /leave_applications/new
  def new
    @leave_application = LeaveApplication.new
    @employee = current_employee
  end

  # GET /leave_applications/1/edit
  def edit
    @employee = current_employee
  end

  # POST /leave_applications or /leave_applications.json
  def create
    @leave_application = LeaveApplication.new(leave_application_params)
    respond_to do |format|
      if @leave_application.save
        LeaveApplicationMailer.employee_apply_for_leave_application(current_employee, @leave_application).deliver_now
        format.html { redirect_to employee_leave_application_path(@leave_application), notice: "Leave application was successfully created." }
        format.json { render :show, status: :created, location: @leave_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leave_applications/1 or /leave_applications/1.json
  def update
    respond_to do |format|
      if @leave_application.update(leave_application_params)
        format.html { redirect_to employee_leave_application_path(@leave_application), notice: "Leave application was successfully updated." }
        format.json { render :show, status: :ok, location: @leave_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leave_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_applications/1 or /leave_applications/1.json
  def destroy
    @leave_application.destroy
    respond_to do |format|
      format.html { redirect_to employee_leave_applications_url, notice: "Leave application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leave_application
      @leave_application = current_employee.leave_applications.find(params[:id])
    end

    # def current_employee
    #   @employee = Employee.find_by(work_email: current_user.email)
    # end

    # Only allow a list of trusted parameters through.
    def leave_application_params
      params.require(:leave_application).permit(:start_date, :end_date, :remarks, :leave_location, :leave_type_id, :employee_id, :is_half_day)
    end
end
