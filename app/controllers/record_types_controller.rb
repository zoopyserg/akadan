class RecordTypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_record_type, only: %i[ show edit update destroy ]

  # GET /record_types or /record_types.json
  def index
    if signed_in?
      @record_types = RecordType.where(is_public: true).or(RecordType.where(user: current_user)).order(created_at: :desc).page(params[:page])
    else
      @record_types = RecordType.where(is_public: true).order(created_at: :desc).page(params[:page])
    end
  end

  # GET /record_types/1 or /record_types/1.json
  def show
  end

  # GET /record_types/new
  def new
    @record_type = current_user.record_types.new
  end

  # GET /record_types/1/edit
  def edit
  end

  # POST /record_types or /record_types.json
  def create
    @record_type = current_user.record_types.new(record_type_params)

    respond_to do |format|
      if @record_type.save
        format.html { redirect_to record_types_path, notice: "Record type was successfully created." }
        format.json { render :show, status: :created, location: @record_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @record_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /record_types/1 or /record_types/1.json
  def update
    respond_to do |format|
      if @record_type.update(record_type_params)
        format.html { redirect_to record_types_path, notice: "Record type was successfully updated." }
        format.json { render :show, status: :ok, location: @record_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_record_type
    if signed_in?
      @record_type = RecordType.where(is_public: true).or(RecordType.where(user: current_user)).find(params[:id])
    else
      @record_type = RecordType.where(is_public: true).find(params[:id])
    end
  end

  # Only allow a list of trusted parameters through.
  def record_type_params
    params.require(:record_type).permit(:name, :description)
  end
end
