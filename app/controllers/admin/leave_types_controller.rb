class Admin::LeaveTypesController < AdminController
  # load_and_authorize_resource
  before_action :set_leave_type, only: %i[ show edit update destroy ]

  def current_ability
    @current_ability ||= ::Ability.new(current_employee)
  end
  
  def index
    @leave_types = LeaveType.all
  end

  def show; end

  def new
    @leave_type = LeaveType.new
  end

  def edit; end

  def create
    @leave_type = LeaveType.new(leave_type_params)

    respond_to do |format|
      if @leave_type.save
        format.html { redirect_to leave_type_url(@leave_type), notice: "Leave type was successfully created." }
        format.json { render :show, status: :created, location: @leave_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leave_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @leave_type.update(leave_type_params)
        format.html { redirect_to leave_type_url(@leave_type), notice: "Leave type was successfully updated." }
        format.json { render :show, status: :ok, location: @leave_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leave_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @leave_type.destroy

    respond_to do |format|
      format.html { redirect_to leave_types_url, notice: "Leave type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_leave_type
    @leave_type = LeaveType.find(params[:id])
  end

  def leave_type_params
    params.require(:leave_type).permit(:name, :description)
  end
end
