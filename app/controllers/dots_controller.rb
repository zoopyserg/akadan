class DotsController < ApplicationController
  before_action :set_dot, only: %i[ show edit update destroy ]

  # GET /dots or /dots.json
  def index
    @dots = Dot.all
  end

  # GET /dots/1 or /dots/1.json
  def show
  end

  # GET /dots/new
  def new
    @dot = Dot.new
  end

  # GET /dots/1/edit
  def edit
  end

  # POST /dots or /dots.json
  def create
    @dot = Dot.new(dot_params)

    respond_to do |format|
      if @dot.save
        format.html { redirect_to @dot, notice: "Dot was successfully created." }
        format.json { render :show, status: :created, location: @dot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dots/1 or /dots/1.json
  def update
    respond_to do |format|
      if @dot.update(dot_params)
        format.html { redirect_to @dot, notice: "Dot was successfully updated." }
        format.json { render :show, status: :ok, location: @dot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dots/1 or /dots/1.json
  def destroy
    @dot.destroy
    respond_to do |format|
      format.html { redirect_to dots_url, notice: "Dot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dot
      @dot = Dot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dot_params
      params.require(:dot).permit(:record_id, :start_date, :start_time, :end_date, :end_time, :income, :duration)
    end
end
