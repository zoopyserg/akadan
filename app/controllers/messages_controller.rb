class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation
  before_action :redirect_to_conversations_if_conversation_is_not_present
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = @conversation.messages.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = @conversation.messages.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = @conversation.messages.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_conversation
    @conversation = current_user.conversations.find_by(id: params[:conversation_id])
  end

  def set_message
    @message = @conversation.messages.find(params[:id])
  end

  def redirect_to_conversations_if_conversation_is_not_present
    redirect_to conversations_path unless @conversation
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:body)
  end
end
