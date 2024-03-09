# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_09_213014) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "affiliations", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "record_a_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_affiliations_on_group_id"
    t.index ["record_a_id"], name: "index_affiliations_on_record_a_id"
  end

  create_table "blocked_users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blockings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "blocked_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocked_user_id"], name: "index_blockings_on_blocked_user_id"
    t.index ["user_id"], name: "index_blockings_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_bookmarks_on_record_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "columns", force: :cascade do |t|
    t.bigint "design_id", null: false
    t.boolean "collapsed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "record_type_id"
    t.boolean "only_separate_projects", default: false
    t.boolean "only_direct_children", default: false
    t.integer "filter_solved_status", default: 0
    t.index ["design_id"], name: "index_columns_on_design_id"
    t.index ["record_type_id"], name: "index_columns_on_record_type_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.text "body"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "connection_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.boolean "is_public", default: true
    t.boolean "directional", default: false
    t.boolean "destructive", default: true
    t.string "target_type"
    t.bigint "target_record_type_id"
    t.bigint "target_record_subtype_id"
    t.string "target_hierarchy"
    t.bigint "closest_parent_type_id"
    t.boolean "one_to_many", default: false
    t.index ["closest_parent_type_id"], name: "index_connection_types_on_closest_parent_type_id"
    t.index ["target_record_subtype_id"], name: "index_connection_types_on_target_record_subtype_id"
    t.index ["target_record_type_id"], name: "index_connection_types_on_target_record_type_id"
    t.index ["user_id"], name: "index_connection_types_on_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.boolean "is_public", default: true
    t.bigint "record_a_id", null: false
    t.bigint "record_b_id", null: false
    t.bigint "connection_type_id", null: false
    t.bigint "group_id"
    t.index ["connection_type_id"], name: "index_connections_on_connection_type_id"
    t.index ["group_id"], name: "index_connections_on_group_id"
    t.index ["record_a_id"], name: "index_connections_on_record_a_id"
    t.index ["record_b_id"], name: "index_connections_on_record_b_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "designable_type"
    t.bigint "designable_id"
    t.boolean "is_public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["designable_type", "designable_id"], name: "index_designs_on_designable"
    t.index ["user_id"], name: "index_designs_on_user_id"
  end

  create_table "desires", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "design_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_id"], name: "index_desires_on_design_id"
    t.index ["group_id"], name: "index_desires_on_group_id"
  end

  create_table "dots", force: :cascade do |t|
    t.bigint "record_id", null: false
    t.bigint "user_id", null: false
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.bigint "project_id", null: false
    t.index ["project_id"], name: "index_dots_on_project_id"
    t.index ["record_id"], name: "index_dots_on_record_id"
    t.index ["user_id"], name: "index_dots_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friend_requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "friend_id", null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id"
    t.index ["user_id"], name: "index_friend_requests_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "record_b_id"
    t.bigint "connection_type_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_type_id"], name: "index_groups_on_connection_type_id"
    t.index ["record_b_id"], name: "index_groups_on_record_b_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sender_id", null: false
    t.text "body"
    t.bigint "conversation_id", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "conversation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_participations_on_conversation_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "readings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "message_id", null: false
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_readings_on_message_id"
    t.index ["user_id"], name: "index_readings_on_user_id"
  end

  create_table "record_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.boolean "is_public", default: true
    t.index ["user_id"], name: "index_record_types_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.boolean "is_public", default: true
    t.bigint "record_type_id", null: false
    t.boolean "separate_project", default: false
    t.integer "records_connected_cached", default: 0
    t.integer "solved_records_connected_cached", default: 0
    t.integer "unsolved_records_connected_cached", default: 0
    t.integer "progress_cached", default: 0
    t.boolean "solved", default: false
    t.float "rank", default: 0.0
    t.float "progress", default: 0.0
    t.boolean "should_solve", default: false
    t.index ["record_type_id"], name: "index_records_on_record_type_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "seminars", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sensors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.text "description"
    t.boolean "is_public", default: true
    t.index ["user_id"], name: "index_sensors_on_user_id"
  end

  create_table "user_record_stats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "record_id", null: false
    t.integer "records_connected_for_me_cached", default: 0
    t.integer "records_connected_for_others_cached", default: 0
    t.integer "solved_records_connected_for_me_cached", default: 0
    t.integer "solved_records_connected_for_others_cached", default: 0
    t.integer "unsolved_records_connected_for_me_cached", default: 0
    t.integer "unsolved_records_connected_for_others_cached", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_user_record_stats_on_record_id"
    t.index ["user_id"], name: "index_user_record_stats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.boolean "accept_terms", default: false
    t.string "avatar"
    t.boolean "is_public", default: true
    t.text "bio"
    t.text "about"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "votable_id"
    t.string "votable_type"
    t.integer "user_id", null: false
    t.boolean "vote_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "affiliations", "records", column: "record_a_id"
  add_foreign_key "blockings", "users"
  add_foreign_key "blockings", "users", column: "blocked_user_id"
  add_foreign_key "bookmarks", "records"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "columns", "designs"
  add_foreign_key "columns", "record_types"
  add_foreign_key "connection_types", "record_types", column: "closest_parent_type_id"
  add_foreign_key "connection_types", "record_types", column: "target_record_subtype_id"
  add_foreign_key "connection_types", "record_types", column: "target_record_type_id"
  add_foreign_key "connection_types", "users"
  add_foreign_key "connections", "connection_types"
  add_foreign_key "connections", "groups"
  add_foreign_key "connections", "records", column: "record_a_id"
  add_foreign_key "connections", "records", column: "record_b_id"
  add_foreign_key "connections", "users"
  add_foreign_key "desires", "designs"
  add_foreign_key "desires", "groups"
  add_foreign_key "dots", "records"
  add_foreign_key "dots", "records", column: "project_id"
  add_foreign_key "dots", "users"
  add_foreign_key "friend_requests", "users"
  add_foreign_key "friend_requests", "users", column: "friend_id"
  add_foreign_key "groups", "records", column: "record_b_id"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "participations", "conversations"
  add_foreign_key "participations", "users"
  add_foreign_key "readings", "messages"
  add_foreign_key "readings", "users"
  add_foreign_key "record_types", "users"
  add_foreign_key "records", "record_types"
  add_foreign_key "records", "users"
  add_foreign_key "sensors", "users"
  add_foreign_key "user_record_stats", "records"
  add_foreign_key "user_record_stats", "users"
end
