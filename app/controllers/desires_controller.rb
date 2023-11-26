class DesiresController < ApplicationController
  # POST /desires
  def create
    if params['commit'] == 'Group...'
      if current_user
       @group = current_user.groups.new(record_a_ids: params['desire']['design_attributes']['group']['record_a_ids'])

       respond_to do |format|
         if @group.save
           format.html { redirect_to edit_group_url(@group) }
         else
           format.html { redirect_to edit_group_url(@group) }
         end
       end
      else
       respond_to do |format|
         format.html { redirect_to new_user_session_url }
         format.html { redirect_to new_user_session_url }
       end
      end
    elsif params['commit'] == 'Update Column Filters'
      params['desire']['design_attributes']['columns_attributes'].each do |key, value|
        if value['id'].present? && current_user.present?
          @column = Column.where(design_id: current_user.designs.pluck(:id)).find_by_id(value['id'])
          if @column
            @column.update(collapsed: value['collapsed'])
          end
        end
      end

      redirect_to controller: session[:previous_controller],
        action: session[:previous_action],
        id: session[:previous_id],
        columns: params['desire']['design_attributes']['columns_attributes'].values.collect{|c|
          {
            collapsed: c['collapsed'],
            record_type_id: c['record_type_id'],
            only_separate_projects: c['only_separate_projects'],
            only_direct_children: c['only_direct_children'],
            filter_solved_status: c['filter_solved_status'],
            page: 1
          }
        }
    elsif params['commit'] == 'Add a Basic Column'
      if current_user
        @designable = nil
        if session[:previous_controller] == 'records' && session[:previous_action] == 'show' && session[:previous_id].present?
          @designable = Record.find_by_id(session[:previous_id])
        elsif session[:previous_controller] == 'users' && session[:previous_action] == 'show' && session[:previous_id].present?
          @designable = User.find_by_id(session[:previous_id])
        end

        @design = current_user.designs.find_by(designable: @designable)
        if !@design
          @design = current_user.designs.create(designable: @designable, is_public: false)
        end
        @column = @design.columns.new(collapsed: false)
        @column.save
        redirect_to controller: session[:previous_controller], action: session[:previous_action], id: session[:previous_id]
      else
        respond_to do |format|
          format.html { redirect_to new_user_session_url }
        end
      end
    end
  end

end
