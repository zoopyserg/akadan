class DotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: %i[ new create ]
  before_action :set_projects, only: %i[ new ]
  before_action :redirect_to_records_path, unless: :record_present?

  # GET /dots or /dots.json
  def index
    @dots = @record.dots.all
  end

  # GET /dots/1 or /dots/1.json
  def show
  end

  # GET /dots/new
  def new
    @dot = @record.dots.new
  end

  # GET /dots/1/edit
  def edit
  end

  # POST /dots or /dots.json
  def create
    @dot = @record.dots.new(dot_params)
    @dot.user = current_user

    respond_to do |format|
      if @dot.save!
        format.html { redirect_to @record, notice: "Dot was successfully created." }
        format.json { render :show, status: :created, location: @record }
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
    @dot = @record.dots.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dot_params
    params.require(:dot).permit(:project_id, :duration, :description)
  end

  def set_record
    if signed_in?
      @record = Record.where(is_public: true).or(Record.where(user: current_user)).find_by(id: params[:record_id])
    else
      @record = Record.where(is_public: true).find_by(id: params[:record_id])
    end
  end

  def set_projects
    if signed_in?
      @projects = Record.where(is_public: true, separate_project: true).or(Record.where(user: current_user, separate_project: true))
    else
      @projects = Record.where(is_public: true, separate_project: true)
    end
  end

  def redirect_to_records_path
    redirect_to records_path
  end

  def record_present?
    @record.present?
  end
end
