class ConnectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_connection, only: %i[ show edit update destroy ]

  # GET /connections or /connections.json
  def index
    @connections = Connection.all
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
        format.html { redirect_to @connection, notice: "Connection was successfully created." }
        format.json { render :show, status: :created, location: @connection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connections/1 or /connections/1.json
  def update
    respond_to do |format|
      if @connection.update(connection_params)
        format.html { redirect_to @connection, notice: "Connection was successfully updated." }
        format.json { render :show, status: :ok, location: @connection }
      else
        format.html { render :edit, status: :unprocessable_entity }
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
      params.require(:connection).permit(:name, :description)
    end
end
