class ConnectionTypesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_connection_type, only: %i[ show edit update ]
  before_action :redirect_to_connection_types_path, only: %i[ edit ], unless: :connection_type_editable?
  before_action :set_target_record_types, only: %i[ new edit ]

  # GET /connection_types or /connection_types.json
  def index
    if signed_in?
      @connection_types = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user)).order(created_at: :desc).page(params[:page])
    else
      @connection_types = ConnectionType.where(is_public: true).order(created_at: :desc).page(params[:page])
    end
  end

  # GET /connection_types/1 or /connection_types/1.json
  def show
  end

  # GET /connection_types/new
  def new
    @connection_type = current_user.connection_types.new(is_public: true)
    @connection_type.destructive = true
    @connection_type.directional = true
    @connection_type.one_to_many = true
    @connection_type.target_type = 'any'
    @connection_type.target_hierarchy = 'all'
  end

  # GET /connection_types/1/edit
  def edit
  end

  # POST /connection_types or /connection_types.json
  def create
    @connection_type = current_user.connection_types.new(connection_type_params)

    respond_to do |format|
      if @connection_type.save
        format.html { redirect_to connection_types_path, notice: "Connection type was successfully created." }
        format.json { render :show, status: :created, location: @connection_type }
      else
        set_target_record_types
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @connection_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connection_types/1 or /connection_types/1.json
  def update
    respond_to do |format|
      if @connection_type.update(connection_type_params)
        format.html { redirect_to connection_types_path, notice: "Connection type was successfully updated." }
        format.json { render :show, status: :ok, location: @connection_type }
      else
        set_target_record_types
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @connection_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_connection_type
    @connection_type = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user)).find_by(id: params[:id]) if params[:id]
  end

  def connection_type_editable?
    @connection_type.present? && @connection_type.user == current_user
  end

  # Only allow a list of trusted parameters through.
  def connection_type_params
    params.require(:connection_type).permit(:name, :is_public, :description, :directional, :destructive, :one_to_many, :target_type, :target_hierarchy, :target_record_type_id, :target_record_subtype_id, :closest_parent_type_id)
    # todo: check via can-can-can that I can't hack it and can't pick IDs for these fields if they are not accessible to me:
    # :target_record_type_id
    # :target_record_subtype_id
    # :closest_parent_type_id
  end

  def redirect_to_connection_types_path
    redirect_to connection_types_path
  end

  def set_target_record_types
    @target_record_types = RecordType.where(is_public: true).or(RecordType.where(user: current_user))
  end
end
