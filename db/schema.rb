# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_20_023123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_tier_types", force: :cascade do |t|
    t.string "description"
  end

  create_table "guild_member_types", force: :cascade do |t|
    t.string "description"
  end

  create_table "guilds", force: :cascade do |t|
    t.string "guild_name"
    t.string "description"
  end

  create_table "servers", force: :cascade do |t|
    t.string "description"
  end

  create_table "timeable_object_logs", force: :cascade do |t|
    t.string "description"
    t.bigint "server_id", null: false
    t.bigint "user_id", null: false
    t.bigint "timeable_object_id", null: false
    t.bigint "guild_id"
    t.index ["guild_id"], name: "index_timeable_object_logs_on_guild_id"
    t.index ["server_id"], name: "index_timeable_object_logs_on_server_id"
    t.index ["timeable_object_id"], name: "index_timeable_object_logs_on_timeable_object_id"
    t.index ["user_id"], name: "index_timeable_object_logs_on_user_id"
  end

  create_table "timeable_object_types", force: :cascade do |t|
    t.string "description"
  end

  create_table "timeable_objects", force: :cascade do |t|
    t.bigint "timeable_object_type_id", null: false
    t.bigint "user_id", null: false
    t.string "map_id"
    t.bigint "interval"
    t.index ["timeable_object_type_id"], name: "index_timeable_objects_on_timeable_object_type_id"
    t.index ["user_id"], name: "index_timeable_objects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_tier_type_id"
    t.bigint "guild_member_type_id"
    t.bigint "guild_id"
    t.string "first_name", null: false
    t.string "last_name"
    t.string "user_bio"
    t.string "user_nickname", null: false
    t.index ["account_tier_type_id"], name: "index_users_on_account_tier_type_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["guild_id"], name: "index_users_on_guild_id"
    t.index ["guild_member_type_id"], name: "index_users_on_guild_member_type_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "timeable_object_logs", "guilds"
  add_foreign_key "timeable_object_logs", "servers"
  add_foreign_key "timeable_object_logs", "timeable_objects"
  add_foreign_key "timeable_object_logs", "users"
  add_foreign_key "timeable_objects", "timeable_object_types"
  add_foreign_key "timeable_objects", "users"
  add_foreign_key "users", "account_tier_types"
  add_foreign_key "users", "guild_member_types"
  add_foreign_key "users", "guilds"
end
