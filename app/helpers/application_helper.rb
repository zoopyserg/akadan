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

  def records_for_column(records, record_types, column)
    final_records = records

    if column.record_type_id.present?
      record_type = record_types.find_by(id: column.record_type_id)

      if record_type
        final_records = records.where(record_type_id: column.record_type_id)
      else
        final_records = Record.none
      end
    else
      records
    end

    final_records
  end
end
