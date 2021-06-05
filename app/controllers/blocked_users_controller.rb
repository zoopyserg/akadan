class BlockedUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blocked_user, only: %i[ show edit update destroy ]

  # GET /blocked_users or /blocked_users.json
  def index
    @blocked_users = BlockedUser.all
  end

  # GET /blocked_users/1 or /blocked_users/1.json
  def show
  end

  # GET /blocked_users/new
  def new
    @blocked_user = BlockedUser.new
  end

  # GET /blocked_users/1/edit
  def edit
  end

  # POST /blocked_users or /blocked_users.json
  def create
    @blocked_user = BlockedUser.new(blocked_user_params)

    respond_to do |format|
      if @blocked_user.save
        format.html { redirect_to @blocked_user, notice: "Blocked user was successfully created." }
        format.json { render :show, status: :created, location: @blocked_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blocked_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blocked_users/1 or /blocked_users/1.json
  def update
    respond_to do |format|
      if @blocked_user.update(blocked_user_params)
        format.html { redirect_to @blocked_user, notice: "Blocked user was successfully updated." }
        format.json { render :show, status: :ok, location: @blocked_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blocked_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocked_users/1 or /blocked_users/1.json
  def destroy
    @blocked_user.destroy
    respond_to do |format|
      format.html { redirect_to blocked_users_url, notice: "Blocked user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blocked_user
      @blocked_user = BlockedUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blocked_user_params
      params.require(:blocked_user).permit(:name)
    end
end
