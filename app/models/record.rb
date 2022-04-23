class Record < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :user
  belongs_to :record_type
  has_many :dots, dependent: :destroy
  has_many :project_dots, class_name: 'Dot', foreign_key: :project_id
  has_many :bookmarks, dependent: :destroy

  has_many :connections_as_source, class_name: 'Connection', foreign_key: :record_a_id
  has_many :connections_as_target, class_name: 'Connection', foreign_key: :record_b_id

  has_many :comments, as: :commentable, dependent: :destroy

  has_many :user_record_stats, dependent: :destroy
  ### VALIDATIONS (validates, validate)
  validates :name, presence: true
  ### CALLBACKS
  after_create :recalculate_cached_tree_counters

  ### NESTED ATTRIBUTES
  accepts_nested_attributes_for :dots
  ### SCOPES
  scope :projects, -> { where(separate_project: true) }

  scope :visible_to_user, -> (user) { where(is_public: true).or(where(user: user)) }
  scope :without_source, -> (record_a) { where.not(id: record_a.id) }
  scope :of_type, -> (type) { where(record_type: type) }

  scope :accessible_record_bs, -> (user, record_a) { visible_to_user(user).without_source(record_a) }
  scope :accessible_record_bs_by_type, -> (user, record_a, type) { accessible_record_bs(user, record_a).of_type(type) }
  scope :accessible_record_bs_by_subtype, -> (user, record_a, type, subtype) { accessible_record_bs_by_type(user, record_a, subtype).joins(:connections_as_target).where(connections: { record_a: (accessible_record_bs_by_type(user, record_a, type) ) })}

  scope :all_roots, -> { where.not(id: Connection.pluck(:record_b_id)) }
  scope :siblings, -> (user, record_a) { where(id: Record.children(Record.parents(record_a)) ).without_source(record_a) }
  scope :children, -> (parent_ids) { Connection.where(record_a_id: parent_ids).pluck(:record_b_id) }
  scope :parents, -> (record_a) { Connection.where(record_b_id: record_a.id).pluck(:record_a_id) }

  scope :all_parents_of_record, -> (record) { where(id: ActiveRecord::Base.connection.execute(all_parent_ids(record)).pluck('id')).without_source(record) }
  scope :all_tree_records_of_record, -> (record) { where(id: ActiveRecord::Base.connection.execute(all_tree_record_ids(record)).pluck('id')) }

  scope :deep_siblings, -> (record) { all_tree_records_of_record(record).where.not(id: Record.all_parents_of_record(record)).without_source(record) }
  scope :root, -> (record) { all_tree_records_of_record(record).where.not(id: all_tree_records_of_record(record).joins(:connections_as_target).joins(:connections_as_target)).without_source(record) }
  scope :parents_specific_type, -> (record, _type) { all_parents_of_record(record).where(record_type: _type).without_source(record) }
  scope :closest_of_type, -> (record, _type) { all_parents_of_record(record).where(record_type: _type).order(created_at: :desc).limit(1) }

  scope :without_potential_cycles, -> (record) { where.not(id: ActiveRecord::Base.connection.execute(all_parent_ids(record)).pluck('id')).without_source(record) }
  scope :all_without_cycles, -> (record) { without_potential_cycles(record).without_source(record) }
  scope :all_roots_without_cycles, -> (record) { all_roots.without_potential_cycles(record).without_source(record) }

  scope :all_children_of_record, -> (record) { where(id: ActiveRecord::Base.connection.execute(all_child_ids(record)).pluck('id')).without_source(record) }
  scope :last_children_of_record, -> (record) { all_children_of_record(record).where.not(id: Record.joins(:connections_as_source).where(id: Record.all_children_of_record(record).pluck(:id))) }

  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS

  def self.only_solved
    all.select do |record|
      Record.all_solved_tree_records_of_record(record).pluck(:id).include? record.id
    end
  end

  def self.only_unsolved
    all.select do |record|
      Record.all_unsolved_tree_records_of_record(record).pluck(:id).include? record.id
    end
  end

  def self.all_unsolved_tree_records_of_record(record)
    Record.where(id: ActiveRecord::Base.connection.execute(all_unsolved_tree_record_ids(record)).pluck('id'))
  end

  def self.all_solved_tree_records_of_record(record)
    Record.where(id: ActiveRecord::Base.connection.execute(all_solved_tree_record_ids(record)).pluck('id'))
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
  end

  def self.all_tree_record_ids(record)
    <<-SQL
      WITH RECURSIVE search_tree(id, path) AS (
          SELECT id, ARRAY[id]
          FROM records
          WHERE id = #{record.id}
        UNION
          SELECT records.id, path || records.id
          FROM search_tree
          JOIN connections ON (connections.record_b_id = search_tree.id OR connections.record_a_id = search_tree.id)
          JOIN records ON (records.id = connections.record_a_id OR records.id = connections.record_b_id)
          WHERE NOT records.id = ANY(path)
      )
      SELECT id FROM search_tree ORDER BY path
    SQL
  end

  def self.all_solved_tree_record_ids(record)
    <<-SQL
      WITH RECURSIVE solution_connection_type AS (#{ ConnectionType.where(name: 'Is Solved By...').limit(1).to_sql }),
                     all_tree_nodes(id, path) AS (
                         SELECT id, ARRAY[id]
                         FROM records
                         WHERE id = #{record.id}
                       UNION
                         SELECT records.id, path || records.id
                         FROM all_tree_nodes
                         JOIN connections ON (connections.record_b_id = all_tree_nodes.id OR connections.record_a_id = all_tree_nodes.id)
                         JOIN records ON (records.id = connections.record_a_id OR records.id = connections.record_b_id)
                         WHERE NOT records.id = ANY(path)
                     ),
                     solved_records_ids(record_a_id) AS (SELECT record_a_id FROM connections WHERE connection_type_id = (SELECT id FROM solution_connection_type) ),
                     solved_record_ids_in_this_tree(id) AS (SELECT id FROM all_tree_nodes INNER JOIN solved_records_ids ON all_tree_nodes.id = solved_records_ids.record_a_id),
                     solutions_ids(id) AS ( SELECT record_b_id FROM connections WHERE connection_type_id = (SELECT id FROM solution_connection_type) ),
                     solved_nodes_in_tree(id, path) AS (
                         SELECT id, ARRAY[id]
                         FROM records
                         WHERE id IN (
                             SELECT id
                             FROM solved_record_ids_in_this_tree
                           )
                       UNION
                         SELECT * FROM (
                           WITH solved_nodes_in_tree_inner AS (
                             SELECT * FROM solved_nodes_in_tree
                           )
                           SELECT parents.id, path || parents.id
                           FROM solved_nodes_in_tree_inner solved_nodes_in_tree

                           JOIN connections ON (connections.record_b_id = solved_nodes_in_tree.id)
                                            AND (
                                                TRUE IN (
                                                  SELECT destructive
                                                  FROM connection_types
                                                  WHERE connections.connection_type_id = connection_types.id
                                                )
                                              )
                                            AND (
                                                  SELECT BOOL_AND(is_solved) AND (
                                                                                   (
                                                                                     FALSE NOT IN (
                                                                                       SELECT ct.destructive
                                                                                       FROM connections co
                                                                                       JOIN connection_types ct
                                                                                         ON co.connection_type_id = ct.id
                                                                                       WHERE co.record_a_id = connections.record_a_id
                                                                                     )
                                                                                   )
                                                                                   OR
                                                                                   (
                                                                                     connections.record_a_id IN (
                                                                                       SELECT record_a_id
                                                                                       FROM solved_records_ids
                                                                                     )
                                                                                   )
                                                                                 )
                                                  FROM (
                                                    SELECT (
                                                      EXISTS (
                                                        SELECT *
                                                        FROM solved_nodes_in_tree_inner
                                                        WHERE solved_nodes_in_tree_inner.id = children.id
                                                      )
                                                    ) is_solved
                                                    FROM records children
                                                    WHERE children.id IN (
                                                      SELECT record_b_id
                                                      FROM connections c
                                                      WHERE c.record_a_id = connections.record_a_id
                                                    )
                                                  ) q
                                                )
                           JOIN records parents ON (parents.id = connections.record_a_id)
                           WHERE (NOT parents.id = ANY(path))
                         ) t
                     ),
                     unsolved_nodes_in_tree(id) AS (SELECT * FROM all_tree_nodes WHERE all_tree_nodes.id NOT IN (SELECT id FROM solved_nodes_in_tree) )
      SELECT id FROM solved_nodes_in_tree ORDER BY path
    SQL
  end

  def self.all_unsolved_tree_record_ids(record)
    <<-SQL
      WITH RECURSIVE solution_connection_type AS (#{ ConnectionType.where(name: 'Is Solved By...').limit(1).to_sql }),
                     all_tree_nodes(id, path) AS (
                         SELECT id, ARRAY[id]
                         FROM records
                         WHERE id = #{record.id}
                       UNION
                         SELECT records.id, path || records.id
                         FROM all_tree_nodes
                         JOIN connections ON (connections.record_b_id = all_tree_nodes.id OR connections.record_a_id = all_tree_nodes.id)
                         JOIN records ON (records.id = connections.record_a_id OR records.id = connections.record_b_id)
                         WHERE NOT records.id = ANY(path)
                     ),
                     solved_records_ids(record_a_id) AS (SELECT record_a_id FROM connections WHERE connection_type_id = (SELECT id FROM solution_connection_type) ),
                     solved_record_ids_in_this_tree(id) AS (SELECT id FROM all_tree_nodes INNER JOIN solved_records_ids ON all_tree_nodes.id = solved_records_ids.record_a_id),
                     solutions_ids(id) AS ( SELECT record_b_id FROM connections WHERE connection_type_id = (SELECT id FROM solution_connection_type) ),
                     solved_nodes_in_tree(id, path) AS (
                         SELECT id, ARRAY[id]
                         FROM records
                         WHERE id IN (
                             SELECT id
                             FROM solved_record_ids_in_this_tree
                           )
                       UNION
                         SELECT * FROM (
                           WITH solved_nodes_in_tree_inner AS (
                             SELECT * FROM solved_nodes_in_tree
                           )
                           SELECT parents.id, path || parents.id
                           FROM solved_nodes_in_tree_inner solved_nodes_in_tree

                           JOIN connections ON (connections.record_b_id = solved_nodes_in_tree.id)
                                            AND (
                                                TRUE IN (
                                                  SELECT destructive
                                                  FROM connection_types
                                                  WHERE connections.connection_type_id = connection_types.id
                                                )
                                              )
                                            AND (
                                                  SELECT BOOL_AND(is_solved) AND (
                                                                                   (
                                                                                     FALSE NOT IN (
                                                                                       SELECT ct.destructive
                                                                                       FROM connections co
                                                                                       JOIN connection_types ct
                                                                                         ON co.connection_type_id = ct.id
                                                                                       WHERE co.record_a_id = connections.record_a_id
                                                                                     )
                                                                                   )
                                                                                   OR
                                                                                   (
                                                                                     connections.record_a_id IN (
                                                                                       SELECT record_a_id
                                                                                       FROM solved_records_ids
                                                                                     )
                                                                                   )
                                                                                 )
                                                  FROM (
                                                    SELECT (
                                                      EXISTS (
                                                        SELECT *
                                                        FROM solved_nodes_in_tree_inner
                                                        WHERE solved_nodes_in_tree_inner.id = children.id
                                                      )
                                                    ) is_solved
                                                    FROM records children
                                                    WHERE children.id IN (
                                                      SELECT record_b_id
                                                      FROM connections c
                                                      WHERE c.record_a_id = connections.record_a_id
                                                    )
                                                  ) q
                                                )
                           JOIN records parents ON (parents.id = connections.record_a_id)
                           WHERE (NOT parents.id = ANY(path))
                         ) t
                     ),
                     unsolved_nodes_in_tree(id) AS (SELECT * FROM all_tree_nodes WHERE all_tree_nodes.id NOT IN (SELECT id FROM solved_nodes_in_tree) )
      SELECT id FROM unsolved_nodes_in_tree
    SQL
  end

  def self.all_child_ids(record)
    <<-SQL
      WITH RECURSIVE search_tree(id, path) AS (
          SELECT id, ARRAY[id]
          FROM records
          WHERE id = #{record.id}
        UNION
          SELECT records.id, path || records.id
          FROM search_tree
          JOIN connections ON connections.record_a_id = search_tree.id
          JOIN records ON records.id = connections.record_b_id
          WHERE NOT records.id = ANY(path)
      )
      SELECT id FROM search_tree ORDER BY path
    SQL
  end

  def progress
    ((1 - ( (Record.last_children_of_record(self).count.to_f) / ( Record.all_children_of_record(self).count.to_f + 1 ) )) * 100).to_i
  end

  def children
    Record.where(id: Record.children(self.id))
  end

  def recalculate_cached_tree_counters
    CountersUpdateWorker.perform_async(self.reload.id)
  end
end
