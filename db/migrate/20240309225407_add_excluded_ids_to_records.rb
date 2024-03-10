class AddExcludedIdsToRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :records, :excluded_ids, :text
    # This stores parents, like "123,15,294,2" etc.
    # Note that at some point (after god knows how many records in the tree) this will become a memory issue issue.
    # We may hit a size limit.
    # Worry about it later.
  end
end
