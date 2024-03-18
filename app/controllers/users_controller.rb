class UsersController < ApplicationController
  include DesignableController

  before_action :authenticate_user!, except: %i[ show ]
  before_action :set_user_to_show, only: %i[ show ]
  before_action :recorect_to_people_path, unless: :user_signed_in?, only: %i[ edit update ]
  before_action :set_user_to_edit, only: %i[ edit update ]
  before_action :set_record_types, only: %i[ show ]
  before_action :set_link_data, only: %i[ show ]

  # GET /users/1 or /users/1.json
  def show
    # store_current_path_globally('users', 'show', @user.id, @user, true)

    if signed_in? && (@user == current_user)
      @records = Record.where(user: @user)
    else
      @records = Record.where(user: @user, is_public: true)
    end

    @show_friends_list = (@user.is_public? || @user == current_user)

    process_request_data
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    # Check if the user is trying to change their password
    if updating_password?
      update_with_password
    else
      update_without_password
    end
  end

  private
  def update_with_password
    if @user.update_with_password(user_params)
      bypass_sign_in(@user) # Sign in the user by bypassing validation in case their password changed
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def update_without_password
    params = user_params.except(:current_password, :password, :password_confirmation)
    if @user.update_without_password(params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def updating_password?
    params[:user][:password].present? && params[:user][:password_confirmation].present?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user_to_show
    @user = User.find(params[:id])
  end

  def set_user_to_edit
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def user_params
    list_of_permitted_parameters = [:first_name, :last_name, :email, :username, :bio, :about, :avatar]
    if updating_password?
      list_of_permitted_parameters += [:password, :password_confirmation, :current_password]
    end
    params.require(:user).permit(*list_of_permitted_parameters)
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
