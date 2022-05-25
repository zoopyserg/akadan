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

  def records_for_column(records, record_types, column, record = nil)
    # filter by type
    filtered_by_type_records = records

    if column.record_type_id.present?
      record_type = record_types.find_by(id: column.record_type_id)

      if record_type
        filtered_by_type_records = records.where(record_type_id: column.record_type_id)
      else
        filtered_by_type_records = Record.none
      end
    else
      records
    end

    # filter by being separate
    filtered_by_being_separate = filtered_by_type_records

    if column.only_separate_projects
      filtered_by_being_separate = filtered_by_type_records.where(separate_project: true)
    end

    filtered_by_being_separate

    # filter by being deep nested
    filtered_by_being_deep_nested = filtered_by_being_separate

    if record
      if column.only_direct_children
        filtered_by_being_deep_nested = filtered_by_being_separate.where(id: record.children.pluck(:id))
      else
        filtered_by_being_deep_nested = filtered_by_being_separate.where(id: Record.all_children_of_record(record).pluck(:id))
      end
    end

    filtered_by_being_deep_nested
  end
end
