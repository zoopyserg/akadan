class MessageChainsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message_chain, only: %i[ show edit update destroy ]

  # GET /message_chains or /message_chains.json
  def index
    @message_chains = current_user.message_chains.all
  end

  # GET /message_chains/1 or /message_chains/1.json
  def show
  end

  # GET /message_chains/new
  def new
    @message_chain = current_user.message_chains.new
  end

  # GET /message_chains/1/edit
  def edit
  end

  # POST /message_chains or /message_chains.json
  def create
    @message_chain = current_user.message_chains.new(message_chain_params)

    respond_to do |format|
      if @message_chain.save
        format.html { redirect_to @message_chain, notice: "Message chain was successfully created." }
        format.json { render :show, status: :created, location: @message_chain }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message_chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_chains/1 or /message_chains/1.json
  def update
    respond_to do |format|
      if @message_chain.update(message_chain_params)
        format.html { redirect_to @message_chain, notice: "Message chain was successfully updated." }
        format.json { render :show, status: :ok, location: @message_chain }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message_chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_chains/1 or /message_chains/1.json
  def destroy
    @message_chain.destroy
    respond_to do |format|
      format.html { redirect_to message_chains_url, notice: "Message chain was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_chain
      @message_chain = current_user.message_chains.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_chain_params
      params.require(:message_chain).permit(:name)
    end
end
