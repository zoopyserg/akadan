class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation
  before_action :redirect_to_conversations_if_conversation_is_not_present

  # GET /messages or /messages.json
  def index
    @messages = @conversation.messages.all
    @message = Message.new
  end

  # POST /messages or /messages.json
  def create
    @message = @conversation.messages.new(message_params)
    @message.sender = current_user

    respond_to do |format|
      if @message.save
        @conversation.users.each do |user|
          Reading.create message: @message, user: user, read: (user == current_user)
        end

        format.html { redirect_to conversation_messages_path(@conversation) }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { redirect_to conversation_messages_path(@conversation) }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_conversation
    @conversation = current_user.conversations.find_by(id: params[:conversation_id])
  end

  def redirect_to_conversations_if_conversation_is_not_present
    redirect_to conversations_path unless @conversation
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:body, :conversation_id)
  end
end
