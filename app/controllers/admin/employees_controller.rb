class Admin::EmployeesController < AdminController
  # load_and_authorize_resource
  before_action :set_employee, only: %i[ show edit update destroy ]

 def current_ability
    @current_ability ||= ::Ability.new(current_employee)
  end

  def index
    @employees = Employee.all
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to admin_employee_path(@employee), notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to admin_employee_path(@employee), notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to admin_employees_path, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :middle_name, :last_name, :date_of_birth, :date_of_joining, :email, :primary_contact, :secondary_contact, :address_line_1, :address_line_2, :city, :state, :country, :pincode, :gender, :title, :employee_code)
  end
end
