class ProgramsController < AuthorizedController
  before_action :set_program, only: %i[show edit update destroy]

  # GET /programs
  def index
    @programs = @current_tenant.programs
  end

  # GET /programs/1
  def show
  end

  # GET /programs/new
  def new
    @program = Program.new  # Corrected this line
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  def create
    @program = @current_tenant.programs.new(program_params)  # Corrected this line

    respond_to do |format|
      if @program.save
        format.html { redirect_to tenant_programs_url(@program), notice: "Program was successfully created." }
        format.json { render :show, status: :created, location: @program }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to tenant_programs_url(@program), notice: "Program was successfully updated." }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to tenant_programs_url, notice: "Program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_program
    @program = Program.find(params[:id])
  end

  def program_params
    params.require(:program).permit(:name, :price, :duration)
  end

  def current_tenant_id
    @current_tenant.id
  end
end
