class Group < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :record_b, class_name: 'Record', optional: true
  belongs_to :connection_type, optional: true
  belongs_to :user
  has_many :affiliations
  has_many :record_as, through: :affiliations, class_name: 'Record'
  has_many :connections

  ### VALIDATIONS (validates, validate)
  ### CALLBACKS
  before_update :destroy_all_connections
  before_update :remove_wrong_record_b
  before_update :recreate_connections

  ### NESTED ATTRIBUTES
  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS
  def destroy_all_connections
    Connection.where(group: self).destroy_all
  end

  def remove_wrong_record_b
    @current_record_b = record_b

    if @current_record_b.present? && connection_type.present?
      @record_b_ids = []

      record_as.each do |record_a|
        @record_b_ids << connection_type.possible_records_b_for(user, record_a).pluck(:id)
      end

      @record_b_ids = @record_b_ids.inject(:&)

      if @record_b_ids.blank?
        @record_bs = Record.where(is_public: true).or(Record.where(user: user)).pluck(:id)
      else
        @record_bs = Record.where(is_public: true).or(Record.where(user: user)).where(id: @record_b_ids).pluck(:id)
      end

      if !@record_bs.include?(@current_record_b.id)
        self.record_b_id = nil
        self.errors[:base] << @current_record_b.name + " can not be a group for selected Record A's"
      end
    end
  end

  def recreate_connections
    affiliations.each do |affiliation|
      affiliation.create_connection
    end
  end
end
