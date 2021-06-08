class SensorsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_sensor, only: %i[ show edit update destroy ]

  # GET /sensors or /sensors.json
  def index
    if signed_in?
      @sensors = Sensor.where(is_public: true).or(Sensor.where(user: current_user))
    else
      @sensors = Sensor.where(is_public: true)
    end
  end

  # GET /sensors/1 or /sensors/1.json
  def show
  end

  # GET /sensors/new
  def new
    @sensor = current_user.sensors.new
  end

  # GET /sensors/1/edit
  def edit
  end

  # POST /sensors or /sensors.json
  def create
    @sensor = current_user.sensors.new(sensor_params)

    respond_to do |format|
      if @sensor.save
        format.html { redirect_to @sensor, notice: "Sensor was successfully created." }
        format.json { render :show, status: :created, location: @sensor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sensors/1 or /sensors/1.json
  def update
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.html { redirect_to @sensor, notice: "Sensor was successfully updated." }
        format.json { render :show, status: :ok, location: @sensor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sensors/1 or /sensors/1.json
  def destroy
    @sensor.destroy
    respond_to do |format|
      format.html { redirect_to sensors_url, notice: "Sensor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sensor
      @sensor = current_user.sensors.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sensor_params
      params.require(:sensor).permit(:name, :description)
    end
end
