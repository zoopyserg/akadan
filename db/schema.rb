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

ActiveRecord::Schema.define(version: 2021_08_17_002648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocked_users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "blockings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "blocked_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blocked_user_id"], name: "index_blockings_on_blocked_user_id"
    t.index ["user_id"], name: "index_blockings_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_id"], name: "index_bookmarks_on_record_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "connection_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.boolean "is_public"
    t.boolean "directional"
    t.boolean "destructive"
    t.string "target_type"
    t.bigint "target_record_type_id"
    t.bigint "target_record_subtype_id"
    t.string "target_hierarchy"
    t.bigint "closest_parent_type_id"
    t.boolean "one_to_many"
    t.index ["closest_parent_type_id"], name: "index_connection_types_on_closest_parent_type_id"
    t.index ["target_record_subtype_id"], name: "index_connection_types_on_target_record_subtype_id"
    t.index ["target_record_type_id"], name: "index_connection_types_on_target_record_type_id"
    t.index ["user_id"], name: "index_connection_types_on_user_id"
  end

  create_table "connections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.boolean "is_public"
    t.bigint "record_a_id", null: false
    t.bigint "record_b_id", null: false
    t.bigint "connection_type_id", null: false
    t.index ["connection_type_id"], name: "index_connections_on_connection_type_id"
    t.index ["record_a_id"], name: "index_connections_on_record_a_id"
    t.index ["record_b_id"], name: "index_connections_on_record_b_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dots", force: :cascade do |t|
    t.bigint "record_id", null: false
    t.bigint "user_id", null: false
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.bigint "project_id", null: false
    t.index ["project_id"], name: "index_dots_on_project_id"
    t.index ["record_id"], name: "index_dots_on_record_id"
    t.index ["user_id"], name: "index_dots_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friend_requests", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "friend_id", null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id"
    t.index ["user_id"], name: "index_friend_requests_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "sender_id", null: false
    t.text "body"
    t.bigint "conversation_id", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "conversation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_participations_on_conversation_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "readings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "message_id", null: false
    t.boolean "read"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_readings_on_message_id"
    t.index ["user_id"], name: "index_readings_on_user_id"
  end

  create_table "record_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.boolean "is_public"
    t.index ["user_id"], name: "index_record_types_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.boolean "is_public"
    t.bigint "record_type_id", null: false
    t.boolean "separate_project", default: false
    t.index ["record_type_id"], name: "index_records_on_record_type_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "seminars", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sensors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.text "description"
    t.boolean "is_public"
    t.index ["user_id"], name: "index_sensors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.boolean "accept_terms"
    t.string "avatar"
    t.boolean "is_public"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blockings", "users"
  add_foreign_key "blockings", "users", column: "blocked_user_id"
  add_foreign_key "bookmarks", "records"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "connection_types", "record_types", column: "closest_parent_type_id"
  add_foreign_key "connection_types", "record_types", column: "target_record_subtype_id"
  add_foreign_key "connection_types", "record_types", column: "target_record_type_id"
  add_foreign_key "connection_types", "users"
  add_foreign_key "connections", "connection_types"
  add_foreign_key "connections", "records", column: "record_a_id"
  add_foreign_key "connections", "records", column: "record_b_id"
  add_foreign_key "connections", "users"
  add_foreign_key "dots", "records"
  add_foreign_key "dots", "records", column: "project_id"
  add_foreign_key "dots", "users"
  add_foreign_key "friend_requests", "users"
  add_foreign_key "friend_requests", "users", column: "friend_id"
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
end
