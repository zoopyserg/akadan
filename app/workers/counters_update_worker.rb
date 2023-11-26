class CountersUpdateWorker
  include Sidekiq::Worker

  def perform(record_id)
    record = Record.find(record_id)

    all_tree_records = Record.all_tree_records_of_record(record)
    record_ids = all_tree_records.pluck(:id)

    all_tree_records_loaded = all_tree_records.all

    all_solved_records_loaded = Record.all_solved_tree_records_of_record(record).all
    all_unsolved_records_loaded = Record.all_unsolved_tree_records_of_record(record).all

    Record.where(id: record_ids).update_all(records_connected_cached: all_tree_records_loaded.count, solved_records_connected_cached: all_solved_records_loaded.count, unsolved_records_connected_cached: all_unsolved_records_loaded.count)

    array_of_hashes = []

    all_tree_records_loaded.each do |the_record|
      the_record.progress_cached = the_record.progress
      the_record.save
    end

    all_tree_records_loaded.each do |the_record|
      User.all.each do |the_user|
        array_of_hashes << {
          record_id: the_record.id,
          user_id: the_user.id,
          records_connected_for_me_cached: all_tree_records_loaded.select{ |rec| rec.user_id == the_user.id }.count,
          records_connected_for_others_cached: all_tree_records_loaded.select{ |rec| rec.user_id != the_user.id}.count,
          solved_records_connected_for_me_cached: all_solved_records_loaded.select{ |rec| rec.user_id == the_user.id }.count,
          solved_records_connected_for_others_cached: all_solved_records_loaded.select{ |rec| rec.user_id != the_user.id}.count,
          unsolved_records_connected_for_me_cached: all_unsolved_records_loaded.select{ |rec| rec.user_id == the_user.id }.count,
          unsolved_records_connected_for_others_cached: all_unsolved_records_loaded.select{ |rec| rec.user_id != the_user.id}.count,
          created_at: Time.now,
          updated_at: Time.now
        }
      end
    end

    UserRecordStat.where(record_id: record_ids).delete_all
    UserRecordStat.insert_all(array_of_hashes)
  end
end
