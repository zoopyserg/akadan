class DesiresController < ApplicationController
  # POST /desires
  def create
    # {"authenticity_token"=>"[FILTERED]", "commit"=>"Group...",
    #  "desire"=>{
    #    "design_attributes"=>{
    #      "columns_attributes"=>{"0"=>{"id"=>"", "collapsed"=>"true"} },
    #      "group"=>{
    #        "record_a_ids"=>["", "1", "2"]
    #      }
    #    }
    #  },
    #  "record_type_id"=>"", "search_terms"=>""}
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

      # todo: do column id in params too, as I'm updating them
      redirect_to controller: session[:previous_controller], action: session[:previous_action], id: session[:previous_id], columns: params['desire']['design_attributes']['columns_attributes'].values.collect{|c| { collapsed: c['collapsed'] } }

      # {
      #   "authenticity_token"=>"[FILTERED]",
      #   "desire"=>{
      #     "design_attributes"=>{
      #       "columns_attributes"=>{
      #         "0"=>{"id"=>"", "collapsed"=>"true"}
      #       },
      #       "group"=>{
      #         "record_a_ids"=>[""]
      #       }
      #     }
      #   },
      #   "record_type_id"=>"",
      #   "search_terms"=>"",
      #   "commit"=>"Update Column Filters"}
    end
  end

  # def desire_params
  #   params.require(:desire).permit(design_attributes: { column_attributes: [], group: { record_a_ids: [] } })
  # end

end
