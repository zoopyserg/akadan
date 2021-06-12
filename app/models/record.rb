class Record < ApplicationRecord
  belongs_to :user
  belongs_to :record_type
  has_many :dots, dependent: :destroy
  has_many :connections_as_source, class_name: 'Connection', foreign_key: :record_a_id
  has_many :connections_as_target, class_name: 'Connection', foreign_key: :record_b_id
  accepts_nested_attributes_for :dots

  scope :visible_to_user, -> (user) { where(is_public: true).or(where(user: user)) }
  scope :without_source, -> (record_a) { where.not(id: record_a.id) }
  scope :of_type, -> (type) { where(record_type: type) }

  scope :accessible_record_bs, -> (user, record_a) { visible_to_user(user).without_source(record_a) }
  scope :accessible_record_bs_by_type, -> (user, record_a, type) { accessible_record_bs(user, record_a).of_type(type) }
  scope :accessible_record_bs_by_subtype, -> (user, record_a, type, subtype) { accessible_record_bs_by_type(user, record_a, subtype).joins(:connections_as_target).where(connections: { record_a: (accessible_record_bs_by_type(user, record_a, type) ) })}
end
