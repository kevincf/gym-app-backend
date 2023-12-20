class WorkoutsController < AuthorizedController
  before_action :set_program
  before_action :set_workout, only: %i[ show edit update destroy ]

  # GET /workouts or /workouts.json
  def index
    @workouts = @program.workouts
  end

  # GET /workouts/1 or /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = @program.workouts.new
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts or /workouts.json
  def create
    @workout = @program.workouts.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to  tenant_program_workout_url(@workout), notice: "Workout was successfully created." }
        format.json { render :show, status: :created, location: [@current_tenant, @program, @workout] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1 or /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to tenant_program_workout_url(@workout), notice: "Workout was successfully updated." }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1 or /workouts/1.json
  def destroy
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to tenant_program_workout_url, notice: "Workout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_workout
    @workout = @program.workouts.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :date, :level)
  end

  def set_program
    @program = @current_tenant.programs.find(params[:program_id])
  end




end
