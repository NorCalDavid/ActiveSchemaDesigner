# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150921010043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fields", force: :cascade do |t|
    t.string   "name"
    t.string   "data_type"
    t.string   "default_value"
    t.boolean  "auto_increment"
    t.boolean  "allow_null"
    t.boolean  "presence"
    t.boolean  "uniqueness"
    t.boolean  "case_sensitive"
    t.boolean  "format"
    t.string   "format_type"
    t.boolean  "acceptance"
    t.boolean  "confirmation"
    t.boolean  "length"
    t.integer  "length_min"
    t.integer  "length_max"
    t.integer  "length_is"
    t.integer  "length_within"
    t.string   "validate_on"
    t.integer  "table_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "comments"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "table_id"
    t.integer  "foreign_key_id"
    t.string   "relationship_type"
    t.string   "primary_port"
    t.string   "foreign_port"
    t.integer  "project_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "relationships", ["foreign_key_id"], name: "index_relationships_on_foreign_key_id", using: :btree
  add_index "relationships", ["table_id", "foreign_key_id"], name: "index_relationships_on_table_id_and_foreign_key_id", unique: true, using: :btree
  add_index "relationships", ["table_id"], name: "index_relationships_on_table_id", using: :btree

  create_table "tables", force: :cascade do |t|
    t.string   "name"
    t.text     "comments"
    t.integer  "project_id"
    t.integer  "position_y", default: 0
    t.integer  "position_x", default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
