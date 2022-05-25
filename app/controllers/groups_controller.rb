class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[ edit update ]
  before_action :set_link_data, only: %i[ edit ]
  before_action :set_record_types, only: %i[ edit ]
  before_action :set_record_as
  before_action :set_record_bs
  before_action :set_connection_types, only: %i[ edit ]

  # GET /groups/1/edit
  def edit
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    # adding new record B
    @new_record_b = nil
    @new_group_params = group_params

    if params[:group][:new_record_b_name].present? && params[:group][:new_record_b_record_type_id].present?
      @new_record_b = current_user.records.create name: params[:group][:new_record_b_name],
                                                  record_type_id: params[:group][:new_record_b_record_type_id],
                                                  is_public: true # todo: add checkbox to the form
      Dot.create description: '', record: @new_record_b, project: @new_record_b, user: current_user, duration: 1
    end

    if @new_record_b
      @new_group_params[:record_b_id] = @new_record_b.id.to_s
    end

    # adding new record a
    @new_record_a = nil
    if params[:group][:new_record_a_name].present? && params[:group][:new_record_a_record_type_id].present?
      @new_record_a = current_user.records.create name: params[:group][:new_record_a_name],
                                                  record_type_id: params[:group][:new_record_a_record_type_id],
                                                  is_public: true # todo: add checkbox to the form
      Dot.create description: '', record: @new_record_a, project: @new_record_a, user: current_user, duration: 1
    end

    if @new_record_a
      @new_group_params[:record_a_ids] << @new_record_a.id.to_s
    end

    # selecting additional existing record a
    if params[:group][:add_existing_record_a_id].present?
      @existing_record = @record_as.find(params[:group][:add_existing_record_a_id])

      if @existing_record
        @new_group_params[:record_a_ids] << @existing_record.id.to_s
      end
    end

    respond_to do |format|
      if @group.update(@new_group_params)
        format.html { redirect_to edit_group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html do
          set_link_data
          set_record_types
          set_record_as
          set_record_bs
          set_connection_types

          render :edit, status: :unprocessable_entity
        end
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = current_user.groups.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit( :record_b_id, :connection_type_id, { record_a_ids: [] } )
  end

  def set_link_data
    @solution_connection_type_id = ConnectionType.solution_connection_type.id
    @solution_record_type_id = RecordType.solution_record_type.id
    @subsystem_connection_type_id = ConnectionType.subsystem_connection_type.id
    @subsystem_record_type_id = RecordType.subsystem_record_type.id
    @extracted_to_connection_type = ConnectionType.extracted_to_connection_type
    @irrelevant_because_connection_type = ConnectionType.irrelevant_because_connection_type
  end

  def set_record_types
    if signed_in?
      @record_types = RecordType.where(is_public: true).or(RecordType.where(user: current_user)).order(created_at: :desc)
    else
      @record_types = RecordType.where(is_public: true).order(created_at: :desc)
    end
  end

  def set_record_as
    if @group.present?
      @record_as = Record.where(is_public: true).or(Record.where(user: current_user)).where.not(id: @group.affiliations.pluck(:record_a_id))
    else
      @record_as = Record.where(is_public: true).or(Record.where(user: current_user))
    end
  end

  def set_record_bs
    # todo: optimize this (put into Postgres)
    @record_b_ids = []

    if @group.present? && @group.connection_type.present?
      @group.record_as.each do |record_a|
        @record_b_ids << @group.connection_type.possible_records_b_for(current_user, record_a).pluck(:id)
      end

      @record_b_ids = @record_b_ids.inject(:&)
    end

    if @record_b_ids.blank?
      @record_bs = Record.where(is_public: true).or(Record.where(user: current_user))
    else
      @record_bs = Record.where(is_public: true).or(Record.where(user: current_user)).where(id: @record_b_ids)
    end
  end

  def set_connection_types
    if signed_in?
      @connection_types = ConnectionType.where(is_public: true).or(ConnectionType.where(user: current_user)).order(created_at: :desc)
    else
      @connection_types = ConnectionType.where(is_public: true).order(created_at: :desc)
    end
  end
end
