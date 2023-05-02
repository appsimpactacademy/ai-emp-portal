class Employee::CompOffsController < EmployeeController
  before_action :set_comp_off, only: %i[ show edit update destroy ]
  # GET /comp_offs or /comp_offs.json
  def index
    @comp_offs = current_employee.comp_offs.order(created_at: :desc)
  end

  # GET /comp_offs/1 or /comp_offs/1.json
  def show
  end

  # GET /comp_offs/new
  def new
    @comp_off = CompOff.new
  end

  # GET /comp_offs/1/edit
  def edit
  end

  # POST /comp_offs or /comp_offs.json
  def create
    @comp_off = CompOff.new(comp_off_params)

    respond_to do |format|
      if @comp_off.save
        CompOffLeavesMailer.employee_apply_for_comp_off(current_employee, @comp_off).deliver_now
        format.html { redirect_to employee_comp_off_path(@comp_off) }
        format.json { render :show, status: :created, location: @comp_off }
        format.js { flash.now[:notice] = 'Comp off was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comp_off.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /comp_offs/1 or /comp_offs/1.json
  def update
    respond_to do |format|
      if @comp_off.update(comp_off_params)
        format.html { redirect_to employee_comp_off_path(@comp_off) }
        format.json { render :show, status: :ok, location: @comp_off }
        format.js { flash.now[:notice] = 'Comp off was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comp_off.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /comp_offs/1 or /comp_offs/1.json
  def destroy
    @comp_off.destroy
    respond_to do |format|
      format.html { redirect_to employee_comp_offs_url, notice: "Comp off was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comp_off
      @comp_off = current_employee.comp_offs.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comp_off_params
      params.require(:comp_off).permit(:for_date, :check_in, :check_out, :description, :status, :employee_id)
    end
end
