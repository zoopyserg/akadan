module ApplicationHelper
  def submit_name
    action_name == 'new' ? 'Create!' : 'Save!'
  end
end
