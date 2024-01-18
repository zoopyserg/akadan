class ConnectionsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_connection_type, except: :index
  before_action :set_record_a, except: %i[index show]
  before_action :set_record_b, only: %i[create update]
  before_action :redirect_to_records_path, unless: :both_connection_type_and_record_a_present?, only: %i[ new edit ]
  before_action :set_connection, only: %i[ show edit update destroy ]
  before_action :set_connection_types, only: %i[ new edit ]
  before_action :set_records_a, only: %i[ new edit ]
  before_action :set_records_b, only: %i[ new edit ]

  # GET
  def index
    if signed_in?
      @connections = Connection.where(is_public: true).or(Connection.where(user: current_user)).order(created_at: :desc).page(params[:page])
    else
      @connections = Connection.where(is_public: true).order(created_at: :desc).page(params[:page])
    end
  end

  # GET
  def show
  end

  # GET
  def new
    @connection = current_user.connections.new
    @connection.record_a = @record_a
    @connection.connection_type = @connection_type
  end

  # GET
  def edit
  end

  # POST
  def create
    @connection = current_user.connections.new(connection_params)
    @connection.record_a = @record_a
    @connection.record_b = @record_b
    @connection.connection_type = @connection_type

    if @connection.valid? && params[:button] == "swap_direction"
      redirect_to new_record_connection_type_connection_path(@connection.record_b, @connection.connection_type)
    else
      respond_to do |format|
        if @connection.save
          format.html { redirect_to connections_path, notice: "Connection was successfully created." }
          format.json { render :show, status: :created, location: @connection }
        else
          format.html do
            set_connection_type
            set_record_a
            set_connection_types
            set_records_a
            set_records_b
            render :new, status: :unprocessable_entity
          end
          format.json { render json: @connection.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # POST
  def into_separate_project
    # handle presence of record type, connection type - todo: вопрос а что будет если публичная запись создана с использованием приватного рекорд типа?
    # create a duplicate
    @record_b = @record_a.dup
    @record_b.user = current_user
    @record_b.separate_project = true # todo: what if it already was a separate project?
    @record_b.save
    # create a connection where record_a is record_id and record_b is duplicate
    @connection = current_user.connections.new
    @connection.record_a = @record_a
    @connection.record_b = @record_b
    @connection.connection_type = @connection_type
    @connection.save
    # redirect to records path.
    respond_to do |format|
      format.html { redirect_to records_path }
    end
  end

  # PATCH/PUT
  def update
    respond_to do |format|
      if @connection.update(connection_params)
        format.html { redirect_to connections_path, notice: "Connection was successfully updated." }
        format.json { render :show, status: :ok, location: @connection }
      else
        format.html do
          set_connection_type
          set_record_a
          set_connection_types
          set_records_a
          set_records_b
          render :edit, status: :unprocessable_entity
        end
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
  def set_connection
    if signed_in?
      @connection = Connection.where(is_public: true).or(Connection.where(user: current_user)).find(params[:id])
    else
      @connection = Connection.where(is_public: true).find(params[:id])
    end
  end

  # Only allow a list of trusted parameters through.
  def connection_params
    params.require(:connection).permit(:name, :description, :connection_type_id, :record_a_id, :record_b_id)
  end

  def set_connection_type
    @connection_type = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user)).find_by(id: params[:connection_type_id]) if params[:connection_type_id].present?
  end

  def set_record_a
    @record_a = Record.where(is_public: true).or(Record.where(user: current_user)).find_by(id: params[:record_id]) if params[:record_id].present?
  end

  def set_record_b
    @record_b = Record.where(is_public: true).or(Record.where(user: current_user)).find_by(id: connection_params[:record_b_id]) if connection_params[:record_b_id].present?
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

  def redirect_to_records_path
    redirect_to records_path
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
