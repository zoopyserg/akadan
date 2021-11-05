class ConversationStartsController < ApplicationController
  before_action :authenticate_user!

  def create
    @participant1 = current_user
    @participant2 = User.find_by(id: params[:person_id]) if params[:person_id]

    if @participant1 && @participant2
      conversations = Conversation.joins(:users).group("conversations.id").select("conversations.*, count(users.id) as usercount, array_agg(users.id) as userids")
      @conversation = conversations.select{ |conversation| conversation.usercount == 2 && conversation.userids.include?(@participant1.id) && conversation.userids.include?(@participant2.id) }.first

      unless @conversation
        @conversation = Conversation.create
        Participation.create user: @participant1, conversation: @conversation
        Participation.create user: @participant2, conversation: @conversation
      end

      respond_to do |format|
        format.html { redirect_to conversation_messages_path(@conversation) }
      end
    end

  end
end
