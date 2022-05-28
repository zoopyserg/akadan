# frozen_string_literal: true

module DesignableController
  extend ActiveSupport::Concern

  included do
  end

  def process_request_data
    process_params
    build_desire
  end

  private
  def build_columns_from_params
    @columns = params[:columns].map.with_index { |column, index| next_column(column, index) }
  end

  def build_columns_from_user_design(designable)
    @columns = [Column.new(collapsed: session[:collapsed], page: 1, filter_solved_status: Column::ANY_SOLVED_STATUS)]

    @design = Design.where(is_public: true).where(designable: designable).first

    if signed_in? && Design.where(user: current_user).where(designable: designable).exists?
      @design = Design.where(user: current_user).where(designable: designable).first
    end

    @columns += @design.columns if @design
  end

  def redirect_to_same_path_with_columns
    redirect_to controller: params[:controller],
      action: params[:action],
      id: params[:id],
      columns: convert_columns_to_params(@columns)
  end

  def convert_columns_to_params(columns)
    columns.collect { |column| displayable_column_params(column) }
  end

  def displayable_column_params(column)
    column.attributes.except('design_id', 'created_at', 'updated_at').merge('page' => 1)
  end

  def next_column(column, index)
    new_page_selected(index) ? column_with_selected_page(column, index) : column
  end

  def column_with_selected_page(column, index)
    column.merge('page' => params['desire']['design_attributes']['columns_attributes'][index.to_s]['page'])
  end

  def build_desire
    @desire = Desire.new
    @desire.build_design
    @desire.build_group
    @columns.each do |column_data|
      @desire.design.columns.build({
        id: column_data['id'],
        collapsed: column_data['collapsed'],
        record_type_id: column_data['record_type_id'],
        only_separate_projects: column_data['only_separate_projects'],
        only_direct_children: column_data['only_direct_children'],
        filter_solved_status: column_data['filter_solved_status'],
        page: column_data['page']
      })
    end
  end

  def store_current_path_globally(controller, action, object_id, designable, collapsed)
    session[:previous_controller] = controller
    session[:previous_action] = action
    session[:previous_id] = object_id
    session[:designable] = designable
    session[:collapsed] = collapsed
  end

  def process_params
    params[:columns].present? ? build_columns_from_params : redirect_to_user_design
  end

  def redirect_to_user_design
    build_columns_from_user_design(session[:designable])
    redirect_to_same_path_with_columns
  end

  def new_page_selected(index)
    params.dig('desire', 'design_attributes', 'columns_attributes', index.to_s, 'page').present?
  end
end
