module MessagesHelper
  def message_classes(message)
    classes = ['card-body']
    classes << 'bg-light' if message_active?(message)
    classes.join ' '
  end

  def message_active?(message)
    message.readings.where(user_id: current_user.id, read: false).any?
  end
end
