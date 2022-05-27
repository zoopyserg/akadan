class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[ show ]
  before_action :set_user_to_show, only: %i[ show ]
  before_action :recorect_to_people_path, unless: :user_signed_in?, only: %i[ edit update ]
  before_action :set_user_to_edit, only: %i[ edit update ]
  before_action :set_record_types, only: %i[ show ]
  before_action :set_link_data, only: %i[ show ]

  # GET /users/1 or /users/1.json
  def show
    # todo: better pagination
    if signed_in? && (@user == current_user)
      @records = Record.where(user: @user).page(params[:page])
    else
      @records = Record.where(user: @user, is_public: true).page(params[:page])
    end

    @show_friends_list = (@user.is_public? || @user == current_user)

    if params[:columns]
      @columns = params[:columns]
    else
      @columns = [Column.new]

      if signed_in?
        if Design.where(user: current_user).where(designable: @user).exists?
          @design = Design.where(user: current_user).where(designable: @user).first
        else
          @design = Design.where(is_public: true).where(designable: @user).first
        end
      else
        @design = Design.where(is_public: true).where(designable: @user).first
      end

      @columns += @design.columns if @design

      redirect_to user_path(@user, columns: @columns.collect{|c| c.attributes.except('design_id', 'created_at', 'updated_at')})
    end

    session[:previous_controller] = 'users'
    session[:previous_action] = 'show'
    session[:previous_id] = @user.id

    @desire = Desire.new
    @desire.build_design
    @desire.build_group
    @columns.each do |column_data|
      @desire.design.columns.build({
        id: column_data['id'],
        collapsed: column_data['collapsed'],
        record_type_id: column_data['record_type_id'],
        only_separate_projects: column_data['only_separate_projects'],
        only_direct_children: column_data['only_direct_children'],
        filter_solved_status: column_data['filter_solved_status']
      })
    end
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_to_show
    @user = User.find(params[:id])
  end

  def set_user_to_edit
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def recorect_to_people_path
    redirect_to people_path
  end

  def set_record_types
    if signed_in?
      @record_types = RecordType.where(is_public: true).or(RecordType.where(user: current_user)).order(created_at: :desc)
    else
      @record_types = RecordType.where(is_public: true).order(created_at: :desc)
    end
  end

  def set_link_data
    @solution_connection_type_id = ConnectionType.solution_connection_type.id
    @solution_record_type_id = RecordType.solution_record_type.id
    @subsystem_connection_type_id = ConnectionType.subsystem_connection_type.id
    @subsystem_record_type_id = RecordType.subsystem_record_type.id
    @extracted_to_connection_type = ConnectionType.extracted_to_connection_type
    @irrelevant_because_connection_type = ConnectionType.irrelevant_because_connection_type
  end
end
