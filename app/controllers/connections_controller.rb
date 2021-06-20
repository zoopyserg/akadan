class ConnectionsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_connection_type
  before_action :set_record
  before_action :redirect_to_connections_path, unless: :both_connection_type_and_record_a_present?, only: %i[ new edit ]
  before_action :set_connection, only: %i[ show edit update destroy ]
  before_action :set_connection_types, only: %i[ new edit ]
  before_action :set_records_a, only: %i[ new edit ]
  before_action :set_records_b, only: %i[ new edit ]

  # GET /connections or /connections.json
  def index
    if signed_in?
      @connections = Connection.where(is_public: true).or(Connection.where(user: current_user)).page(params[:page])
    else
      @connections = Connection.where(is_public: true).page(params[:page])
    end
  end

  # GET /connections/1 or /connections/1.json
  def show
  end

  # GET /connections/new
  def new
    @connection = current_user.connections.new
    @connection.record_a = @record_a
    @connection.connection_type = @connection_type
  end

  # GET /connections/1/edit
  def edit
  end

  # POST /connections or /connections.json
  def create
    @connection = current_user.connections.new(connection_params)

    respond_to do |format|
      if @connection.save
        format.html { redirect_to connections_path, notice: "Connection was successfully created." }
        format.json { render :show, status: :created, location: @connection }
      else
        format.html do
          set_connection_types
          set_records_a
          set_records_b
          render :new, status: :unprocessable_entity
        end
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connections/1 or /connections/1.json
  def update
    respond_to do |format|
      if @connection.update(connection_params)
        format.html { redirect_to connections_path, notice: "Connection was successfully updated." }
        format.json { render :show, status: :ok, location: @connection }
      else
        format.html do
          set_connection_types
          set_records_a
          set_records_b
          render :edit, status: :unprocessable_entity
        end
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connections/1 or /connections/1.json
  def destroy
    @connection.destroy
    respond_to do |format|
      format.html { redirect_to connections_url, notice: "Connection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_connection
    @connection = current_user.connections.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def connection_params
    params.require(:connection).permit(:name, :description, :connection_type_id, :record_a_id, :record_b_id)
  end

  def set_connection_type
    @connection_type = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user)).find_by(id: params[:connection_type_id]) if params[:connection_type_id].present?
  end

  def set_record
    @record_a = Record.where(is_public: true).or(Record.where(user: current_user)).find_by(id: params[:record_id]) if params[:record_id].present?
  end

  def set_connection_types
    @connection_types = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user))
  end

  def set_records_a
    @records_a = Record.where(is_public: true).or(Record.where(user: current_user))
  end

  def set_records_b
    @records_b = @connection_type.possible_records_b_for(current_user, @record_a)
  end

  def redirect_to_connections_path
    redirect_to connections_path
  end

  def record_a_present?
    @record_a.present?
  end

  def connection_type_present?
    @connection_type.present?
  end

  def both_connection_type_and_record_a_present?
    connection_type_present? && record_a_present?
  end
end
