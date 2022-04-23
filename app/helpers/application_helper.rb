module ApplicationHelper
  def submit_name
    action_name == 'new' ? 'Create!' : 'Save!'
  end

  def commentable_comment_name(commentable)
    commentable.is_a?(Record) ? 'Comment' : 'Reply'
  end


  def commentable_form_url_format(commentable)
    commentable.is_a?(Record) ? :html : :js
  end

  def is_record_comment(commentable)
    commentable.is_a?(Record)
  end
end
