class ConnectionTypesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_connection_type, only: %i[ show edit update destroy ]

  # GET /connection_types or /connection_types.json
  def index
    if signed_in?
      @connection_types = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user))
    else
      @connection_types = ConnectionType.where(is_public: true)
    end
  end

  # GET /connection_types/1 or /connection_types/1.json
  def show
  end

  # GET /connection_types/new
  def new
    @connection_type = current_user.connection_types.new
  end

  # GET /connection_types/1/edit
  def edit
  end

  # POST /connection_types or /connection_types.json
  def create
    @connection_type = current_user.connection_types.new(connection_type_params)

    respond_to do |format|
      if @connection_type.save
        format.html { redirect_to @connection_type, notice: "Connection type was successfully created." }
        format.json { render :show, status: :created, location: @connection_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @connection_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connection_types/1 or /connection_types/1.json
  def update
    respond_to do |format|
      if @connection_type.update(connection_type_params)
        format.html { redirect_to @connection_type, notice: "Connection type was successfully updated." }
        format.json { render :show, status: :ok, location: @connection_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @connection_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connection_types/1 or /connection_types/1.json
  def destroy
    @connection_type.destroy
    respond_to do |format|
      format.html { redirect_to connection_types_url, notice: "Connection type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connection_type
      @connection_type = current_user.connection_types.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def connection_type_params
      params.require(:connection_type).permit(:name, :description, :directional, :destructive, :one_to_many, :target_type, :target_hierarchy)
    end
end
