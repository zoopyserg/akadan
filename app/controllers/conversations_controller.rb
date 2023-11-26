class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: %i[ show edit update destroy ]

  # GET /conversations or /conversations.json
  def index
    @conversations = current_user.conversations.all
  end

  # GET /conversations/1 or /conversations/1.json
  def show
    if @conversation
      render 'show'
    else
      redirect_to conversations_path
    end
  end

  # GET /conversations/new
  def new
    @conversation = current_user.conversations.new
  end

  # POST /conversations or /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)

    respond_to do |format|
      if @conversation.save
        Participation.create user: current_user, conversation: @conversation

        format.html { redirect_to @conversation, notice: "Conversation was successfully created." }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_conversation
    @conversation = current_user.conversations.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def conversation_params
    params.fetch(:conversation, {})
  end
end
