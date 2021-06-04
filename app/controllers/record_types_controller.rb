class RecordTypesController < ApplicationController
  before_action :set_record_type, only: %i[ show edit update destroy ]

  # GET /record_types or /record_types.json
  def index
    @record_types = RecordType.all
  end

  # GET /record_types/1 or /record_types/1.json
  def show
  end

  # GET /record_types/new
  def new
    @record_type = RecordType.new
  end

  # GET /record_types/1/edit
  def edit
  end

  # POST /record_types or /record_types.json
  def create
    @record_type = RecordType.new(record_type_params)

    respond_to do |format|
      if @record_type.save
        format.html { redirect_to @record_type, notice: "Record type was successfully created." }
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
        format.html { redirect_to @record_type, notice: "Record type was successfully updated." }
        format.json { render :show, status: :ok, location: @record_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /record_types/1 or /record_types/1.json
  def destroy
    @record_type.destroy
    respond_to do |format|
      format.html { redirect_to record_types_url, notice: "Record type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record_type
      @record_type = RecordType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def record_type_params
      params.require(:record_type).permit(:name)
    end
end
