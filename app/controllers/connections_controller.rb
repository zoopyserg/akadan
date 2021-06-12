class ConnectionsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_connection_type
  before_action :set_connection, only: %i[ show edit update destroy ]
  before_action :set_connection_types, only: %i[ new edit ]
  before_action :set_records_a, only: %i[ new edit ]
  before_action :set_records_b, only: %i[ new edit ]

  # GET /connections or /connections.json
  def index
    if signed_in?
      @connections = Connection.where(is_public: true).or(Connection.where(user: current_user))
    else
      @connections = Connection.where(is_public: true)
    end
  end

  # GET /connections/1 or /connections/1.json
  def show
  end

  # GET /connections/new
  def new
    @connection = current_user.connections.new
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
  # Use callbacks to share common setup or constraints between actions.
  def set_connection
    @connection = current_user.connections.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def connection_params
    params.require(:connection).permit(:name, :description, :connection_type_id, :record_a_id, :record_b_id)
  end

  def set_connection_type
    @connection_type = current_user.connection_types.find(params[:connection_type_id]) if params[:connection_type_id]
  end

  def set_connection_types
    @connection_types = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user))
  end

  def set_records_a
    @records_a = Record.where(is_public: true).or(Record.where(user: current_user))
  end

  def set_records_b
    @records_b = Record.where(is_public: true).or(Record.where(user: current_user))
  end
end
