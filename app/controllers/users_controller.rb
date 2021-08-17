class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[ show ]
  before_action :set_user_to_show, only: %i[ show ]
  before_action :recorect_to_people_path, unless: :user_signed_in?, only: %i[ edit update ]
  before_action :set_user_to_edit, only: %i[ edit update ]

  # GET /users/1 or /users/1.json
  def show
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
end
