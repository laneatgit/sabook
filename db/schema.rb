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

ActiveRecord::Schema.define(version: 20150819054440) do

  create_table "entry_item_lines", force: :cascade do |t|
    t.integer  "entry_item_id"
    t.integer  "subject_id"
    t.integer  "direction"
    t.integer  "amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "entry_item_lines", ["entry_item_id"], name: "index_entry_item_lines_on_entry_item_id"
  add_index "entry_item_lines", ["subject_id"], name: "index_entry_item_lines_on_subject_id"

  create_table "entry_items", force: :cascade do |t|
    t.date     "entry_date"
    t.text     "explanation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subject_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "subject_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "subject_anc_desc_idx", unique: true
  add_index "subject_hierarchies", ["descendant_id"], name: "subject_desc_idx"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "subject_type"
    t.integer  "parent_id"
    t.boolean  "fixed",        default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
