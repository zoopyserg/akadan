class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_record, only: %i[ show edit update destroy ]
  before_action :set_record_types, only: %i[ new edit ]

  # GET /records or /records.json
  def index
    if signed_in?
      @records = Record.where(is_public: true).or(Record.where(user: current_user))
    else
      @records = Record.where(is_public: true)
    end
  end

  # GET /records/1 or /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = current_user.records.new
    @record.dots.build
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records or /records.json
  def create
    @record = current_user.records.new(record_params)
    @record.dots.each do |dot|
      dot.user = current_user
    end

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: "Record was successfully created." }
        format.json { render :show, status: :created, location: @record }
      else
        format.html do
          set_record_types
          render :new, status: :unprocessable_entity
        end
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1 or /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: "Record was successfully updated." }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html do
          set_record_types
          render :edit, status: :unprocessable_entity
        end
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: "Record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @record = Record.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def record_params
    params.require(:record).permit(:name, :description, :record_type_id, dots_attributes: [ :id, :duration ])
  end

  def set_record_types
    @record_types = RecordType.where(is_public: true).or(RecordType.where(user: current_user))
  end
end
