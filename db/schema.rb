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

ActiveRecord::Schema.define(version: 2021_04_28_160943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers_workers", id: false, force: :cascade do |t|
    t.bigint "manager_id"
    t.bigint "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_managers_workers_on_manager_id"
    t.index ["worker_id"], name: "index_managers_workers_on_worker_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "status", default: 1
    t.datetime "vacation_start_date"
    t.datetime "vacation_end_date"
    t.datetime "request_created_at"
    t.integer "resolved_by"
    t.bigint "worker_id"
    t.index ["worker_id"], name: "index_requests_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "managers_workers", "managers"
  add_foreign_key "managers_workers", "workers"
  add_foreign_key "requests", "workers"
end
