class ParticipationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation
  before_action :redirect_to_conversations_if_conversation_is_not_present
  before_action :set_participation, only: %i[ show edit update destroy ]

  # GET /participations or /participations.json
  def index
    @participations = @conversation.participations.all
  end

  # GET /participations/1 or /participations/1.json
  def show
  end

  # GET /participations/new
  def new
    @participation = @conversation.participations.new
  end

  # GET /participations/1/edit
  def edit
  end

  # POST /participations or /participations.json
  def create
    @participation = @conversation.participations.new(participation_params)

    respond_to do |format|
      if @participation.save
        format.html { redirect_to conversation_participations_path(@conversation), notice: "Participat was successfully added." }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participations/1 or /participations/1.json
  def update
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to @participation, notice: "Participation was successfully updated." }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1 or /participations/1.json
  def destroy
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to participations_url, notice: "Participation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_conversation
    @conversation = current_user.conversations.find_by(id: params[:conversation_id])
  end

  def set_participation
    @participation = @conversations_path.participations.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def participation_params
    params.require(:participation).permit(:user_id)
  end

  def redirect_to_conversations_if_conversation_is_not_present
    redirect_to conversations_path unless @conversation
  end
end
