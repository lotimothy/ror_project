ActiveRecord::Schema.define(version: 20161024234445) do

  create_table "donations", force: :cascade do |t|
    t.integer  "resource_id"
    t.integer  "parent_id"
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "donations", ["parent_id"], name: "index_donations_on_parent_id"
  add_index "donations", ["resource_id"], name: "index_donations_on_resource_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["teacher_id"], name: "index_events_on_teacher_id"

  create_table "parents", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resources", ["event_id"], name: "index_resources_on_event_id"

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
