class BulkRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_connection_type
  before_action :set_record_type
  before_action :set_record
  before_action :redirect_to_records_path, unless: :prerequisites_present?
  before_action :set_record_types, only: %i[ new ]
  before_action :set_connection_types, only: %i[ new ]

  def new
  end

  def create
    @record_1 = current_user.records.create name: permitted_params[:record_1_name], record_type: @record_type if permitted_params[:record_1_name].present?
    @record_2 = current_user.records.create name: permitted_params[:record_2_name], record_type: @record_type if permitted_params[:record_2_name].present?
    @record_3 = current_user.records.create name: permitted_params[:record_3_name], record_type: @record_type if permitted_params[:record_3_name].present?
    @record_4 = current_user.records.create name: permitted_params[:record_4_name], record_type: @record_type if permitted_params[:record_4_name].present?
    @record_5 = current_user.records.create name: permitted_params[:record_5_name], record_type: @record_type if permitted_params[:record_5_name].present?
    @record_6 = current_user.records.create name: permitted_params[:record_6_name], record_type: @record_type if permitted_params[:record_6_name].present?
    @record_7 = current_user.records.create name: permitted_params[:record_7_name], record_type: @record_type if permitted_params[:record_7_name].present?
    @record_8 = current_user.records.create name: permitted_params[:record_8_name], record_type: @record_type if permitted_params[:record_8_name].present?
    @record_9 = current_user.records.create name: permitted_params[:record_9_name], record_type: @record_type if permitted_params[:record_9_name].present?
    @record_10 = current_user.records.create name: permitted_params[:record_10_name], record_type: @record_type if permitted_params[:record_10_name].present?

    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_1 if @record_1.present?
    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_2 if @record_2.present?
    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_3 if @record_3.present?
    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_4 if @record_4.present?
    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_5 if @record_5.present?
    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_6 if @record_6.present?
    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_7 if @record_7.present?
    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_8 if @record_8.present?
    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_9 if @record_9.present?
    current_user.connections.create connection_type: @connection_type, record_a: @record, record_b: @record_10 if @record_10.present?

    respond_to do |format|
      format.html { redirect_to records_path, notice: "Records successfully created." }
    end
  end

  private
  def set_connection_type
    @connection_type = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user)).find_by(id: params[:connection_type_id]) if params[:connection_type_id].present?
  end

  def set_record_type
    @record_type = RecordType.where(is_public: true).or(RecordType.where(user: current_user)).find_by(id: params[:record_type_id]) if params[:record_type_id].present?
  end

  def set_record_types
    @record_types = RecordType.where(is_public: true).or(RecordType.where(user: current_user))
  end

  def set_connection_types
    @connection_types = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user))
  end

  def set_record
    @record = Record.where(is_public: true).or(Record.where(user: current_user)).find_by(id: params[:record_id]) if params[:record_id].present?
  end

  def redirect_to_records_path
    redirect_to records_path
  end

  def connection_type_present?
    @connection_type.present?
  end

  def record_present?
    @record.present?
  end

  def record_type_present?
    @record_type.present?
  end

  def prerequisites_present?
    connection_type_present? && record_type_present? && record_present?
  end

  def permitted_params
    params.require(:record_collection).permit(:connection_type_id, :record_type_id, :record_1_name, :record_2_name, :record_3_name, :record_4_name, :record_5_name, :record_6_name, :record_7_name, :record_8_name, :record_9_name, :record_10_name)
  end
end
