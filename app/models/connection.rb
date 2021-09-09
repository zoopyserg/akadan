class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :record_a, class_name: 'Record'
  belongs_to :record_b, class_name: 'Record'
  belongs_to :connection_type

  after_create :recalculate_cached_tree_counters

  def recalculate_cached_tree_counters
    CountersUpdateWorker.perform_async(record_a_id)
    CountersUpdateWorker.perform_async(record_b_id)
  end
end
