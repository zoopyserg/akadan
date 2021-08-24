class RecordsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_record, only: %i[ show edit update ]
  before_action :set_record_types, only: %i[ new edit index show ]
  before_action :redirect_to_records_path, only: %i[ show edit update ], unless: :record_present?

  # GET /records or /records.json
  def index
    if signed_in?
      @records = Record.where(is_public: true).or(Record.where(user: current_user))
    else
      @records = Record.where(is_public: true)
    end

    if params[:record_type_id].present?
      @record_type = @record_types.find_by(id: params[:record_type_id])

      if @record_type
        @records = @records.where(record_type: @record_type)
      else
        @records = []
      end
    end

    if params[:only_solved]
      @records = @records.only_solved
    elsif params[:only_unsolved]
      @records = @records.only_unsolved
    end
  end

  def show
    @record_children_ids = @record.children.pluck(:id)

    if signed_in?
      @records = Record.where(is_public: true).or(Record.where(user: current_user)).where(id: @record_children_ids)
    else
      @records = Record.where(is_public: true).where(id: @record_children_ids)
    end

    if params[:record_type_id].present?
      @record_type = @record_types.find_by(id: params[:record_type_id])

      if @record_type
        @records = @records.where(record_type: @record_type)
      else
        @records = []
      end
    end

    if params[:only_solved]
      @records = @records.only_solved
    elsif params[:only_unsolved]
      @records = @records.only_unsolved
    end
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
    @record.separate_project = true
    @record.dots.each do |dot|
      dot.duration ||= 1
      dot.user = current_user
      dot.project = @record
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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_record
    if signed_in?
      @record = Record.where(is_public: true).or(Record.where(user: current_user)).find_by(id: params[:id])
    else
      @record = Record.where(is_public: true).find_by(id: params[:id])
    end
  end

  def record_present?
    @record.present?
  end

  def redirect_to_records_path
    redirect_to records_path
  end

  # Only allow a list of trusted parameters through.
  def record_params
    params.require(:record).permit(:name, :record_type_id, dots_attributes: [ :id, :description, :duration ])
  end

  def set_record_types
    if signed_in?
      @record_types = RecordType.where(is_public: true).or(RecordType.where(user: current_user)).order(created_at: :desc)
    else
      @record_types = RecordType.where(is_public: true).order(created_at: :desc)
    end
  end
end
