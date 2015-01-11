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

ActiveRecord::Schema.define(version: 20150111083002) do

  create_table "projects", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "projects", ["name"], name: "name", type: :fulltext

  create_table "todo_items", force: true do |t|
    t.integer  "todo_list_id"
    t.text     "content"
    t.boolean  "is_done",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "todo_items", ["is_done"], name: "index_todo_items_on_is_done", using: :btree
  add_index "todo_items", ["position"], name: "index_todo_items_on_position", using: :btree
  add_index "todo_items", ["todo_list_id"], name: "index_todo_items_on_todo_list_id", using: :btree

  create_table "todo_lists", force: true do |t|
    t.integer  "project_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",  default: false
  end

  add_index "todo_lists", ["name"], name: "name", type: :fulltext
  add_index "todo_lists", ["position"], name: "index_todo_lists_on_position", using: :btree
  add_index "todo_lists", ["project_id"], name: "index_todo_lists_on_project_id", using: :btree

  create_table "writings", force: true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "writings", ["project_id"], name: "index_writings_on_project_id", using: :btree
  add_index "writings", ["title", "content"], name: "title", type: :fulltext

end
