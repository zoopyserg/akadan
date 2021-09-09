class CountersUpdateWorker
  include Sidekiq::Worker

  def perform(record_id)
    record = Record.find(record_id)
    all_tree_records = Record.all_tree_records_of_record(record)
    all_solved_records = Record.all_solved_tree_records_of_record(record)
    all_unsolved_records = Record.all_unsolved_tree_records_of_record(record) # does not work. why? perhaps "except record" is the reason?

    all_tree_records.each do |the_record|
      the_record.records_connected_cached = all_tree_records.count
      the_record.solved_records_connected_cached = all_solved_records.count
      the_record.unsolved_records_connected_cached = all_unsolved_records.count
      the_record.progress_cached = the_record.progress
      the_record.save
    end


    # <% if user_signed_in? %>
    #   <p class="mb-0">My records connected: <strong><%= Record.all_tree_records_of_record(record).where(user: current_user).count %></strong></p>
    #   <p class="mb-0">Other people's records connected: <strong><%= Record.all_tree_records_of_record(record).where.not(user: current_user).count %></strong></p>
    # <% end %>

    # <% if user_signed_in? %>
    #   <p class="mb-0">My unsolved records in tree: <strong><%= Record.all_unsolved_tree_records_of_record(record).where(user: current_user).count %></strong></p>
    #   <p class="mb-0">Other people's unsolved records in tree: <strong><%= Record.all_unsolved_tree_records_of_record(record).where.not(user: current_user).count %></strong></p>
    # <% end %>

    # <% if user_signed_in? %>
    #   <p class="mb-0">My solved records in tree: <strong><%= Record.all_solved_tree_records_of_record(record).where(user: current_user).count %></strong></p>
    #   <p class="mb-0">Other people's solved records in tree: <strong><%= Record.all_solved_tree_records_of_record(record).where.not(user: current_user).count %></strong></p>
    # <% end %>
  end
end
