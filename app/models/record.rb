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

  scope :all_roots, -> { where.not(id: Connection.pluck(:record_b_id)) }
  scope :siblings, -> (user, record_a) { where(id: Record.children(Record.parents(record_a)) ) }
  scope :children, -> (parent_ids) { Connection.where(record_a_id: parent_ids).pluck(:record_b_id) }
  scope :parents, -> (record_a) { Connection.where(record_b_id: record_a.id).pluck(:record_a_id) }

  def self.all_parents_of_record(record)
    where(id: ActiveRecord::Base.connection.execute(all_parent_ids(record)).pluck('id'))
  end

  def self.all_parent_ids(record)
    <<-SQL
      WITH RECURSIVE search_tree(id, path) AS (
          SELECT id, ARRAY[id]
          FROM records
          WHERE id = #{record.id}
        UNION
          SELECT records.id, path || records.id
          FROM search_tree
          JOIN connections ON connections.record_b_id = search_tree.id
          JOIN records ON records.id = connections.record_a_id
          WHERE NOT records.id = ANY(path)
      )
      SELECT id FROM search_tree ORDER BY path
    SQL
    # todo: interpolation
  end
end
