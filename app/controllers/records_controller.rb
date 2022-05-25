class RecordsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_record, only: %i[ show edit update ]
  before_action :set_record_types, only: %i[ new edit index show ]
  before_action :redirect_to_records_path, only: %i[ show edit update ], unless: :record_present?
  before_action :set_link_data, only: %i[ index show ]

  # GET /records or /records.json
  def index
    # todo: better pagination
    if signed_in?
      @records = Record.where(is_public: true).or(Record.where(user: current_user))
    else
      @records = Record.where(is_public: true)
    end

    if params[:only_solved]
      @records = @records.only_solved
    elsif params[:only_unsolved]
      @records = @records.only_unsolved
    end

    if params[:columns]
       @columns = params[:columns]
    else
      @columns = [Column.new]

      if signed_in?
        if Design.where(user: current_user).where(designable: nil).exists?
          @design = Design.where(user: current_user).where(designable: nil).first
        else
          @design = Design.where(is_public: true).where(designable: nil).first
        end
      else
        @design = Design.where(is_public: true).where(designable: nil).first
      end

      @columns += @design.columns if @design

      redirect_to records_path(columns: @columns.collect{|c| c.attributes.except('design_id', 'created_at', 'updated_at') })
    end

    session[:previous_controller] = 'records'
    session[:previous_action] = 'index'
    session[:previous_id] = nil

    @desire = Desire.new
    @desire.build_design
    @desire.build_group
    @columns.each do |column_data|
      @desire.design.columns.build({ id: column_data['id'], collapsed: column_data['collapsed'], record_type_id: column_data['record_type_id'] })
    end
  end

  def show
    @record_children_ids = @record.children.pluck(:id)
    @new_comment = @record.comments.new
    @comments = @record.comments.order(created_at: :desc)

    if params[:columns]
      @columns = params[:columns]
    else
      @columns = [Column.new(collapsed: false)]

      if signed_in?
        if Design.where(user: current_user).where(designable: @record).exists?
          @design = Design.where(user: current_user).where(designable: @record).first
        else
          @design = Design.where(is_public: true).where(designable: @record).first
        end
      else
        @design = Design.where(is_public: true).where(designable: @record).first
      end

      @columns += @design.columns if @design

      redirect_to record_path(@record, columns: @columns.collect{|c| c.attributes.except('design_id', 'created_at', 'updated_at')})
    end

    if signed_in?
      @records = Record.where(is_public: true).or(Record.where(user: current_user)).where(id: @record_children_ids)
    else
      @records = Record.where(is_public: true).where(id: @record_children_ids)
    end

    if params[:only_solved]
      @records = @records.only_solved
    elsif params[:only_unsolved]
      @records = @records.only_unsolved
    end

    @subrecords = true

    session[:previous_controller] = 'records'
    session[:previous_action] = 'show'
    session[:previous_id] = @record.id

    @desire = Desire.new
    @desire.build_design
    @desire.build_group
    @columns.each do |column_data|
      @desire.design.columns.build({ id: column_data['id'], collapsed: column_data['collapsed'], record_type_id: column_data['record_type_id'] })
    end
  end

  # GET /records/new
  def new
    @record = current_user.records.new(is_public: true)
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
  def set_link_data
    @solution_connection_type_id = ConnectionType.solution_connection_type.id
    @solution_record_type_id = RecordType.solution_record_type.id
    @subsystem_connection_type_id = ConnectionType.subsystem_connection_type.id
    @subsystem_record_type_id = RecordType.subsystem_record_type.id
    @extracted_to_connection_type = ConnectionType.extracted_to_connection_type
    @irrelevant_because_connection_type = ConnectionType.irrelevant_because_connection_type
  end

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
    params.require(:record).permit(:name, :is_public, :record_type_id, dots_attributes: [ :id, :description, :duration ])
  end

  def set_record_types
    if signed_in?
      @record_types = RecordType.where(is_public: true).or(RecordType.where(user: current_user)).order(created_at: :desc)
    else
      @record_types = RecordType.where(is_public: true).order(created_at: :desc)
    end
  end
end
