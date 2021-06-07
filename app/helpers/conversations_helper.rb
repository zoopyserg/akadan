module ConversationsHelper
  def conversation_classes(conversation)
    classes = ['card-body']
    classes << 'bg-light' if conversation_active?(conversation)
    classes.join ' '
  end

  def conversation_active?(conversation)
    conversation.messages.joins(:readings).where(readings: { user_id: current_user.id, read: false }).any?
  end
end
