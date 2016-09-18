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

ActiveRecord::Schema.define(version: 20160917215652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "estimation_sessions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "sharedLink"
    t.boolean  "synchronous"
    t.datetime "beginningTime"
    t.datetime "endTime"
    t.datetime "realTime"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "strategyId"
    t.integer  "project_id"
    t.index ["project_id"], name: "index_estimation_sessions_on_project_id", using: :btree
  end

  create_table "partial_estimations", force: :cascade do |t|
    t.float    "estimation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "story_id"
    t.index ["story_id"], name: "index_partial_estimations_on_story_id", using: :btree
  end

  create_table "project_memberships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.integer  "user_id"
    t.index ["project_id"], name: "index_project_memberships_on_project_id", using: :btree
    t.index ["user_id"], name: "index_project_memberships_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "estimation_session_id"
    t.integer  "user_id"
    t.index ["estimation_session_id"], name: "index_projects_on_estimation_session_id", using: :btree
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "session_memberships", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "estimation_session_id"
    t.integer  "user_id"
    t.index ["estimation_session_id"], name: "index_session_memberships_on_estimation_session_id", using: :btree
    t.index ["user_id"], name: "index_session_memberships_on_user_id", using: :btree
  end

  create_table "stories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "finalEstimation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "estimation_session_id"
    t.index ["estimation_session_id"], name: "index_stories_on_estimation_session_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "estimation_sessions", "projects"
  add_foreign_key "partial_estimations", "stories"
  add_foreign_key "project_memberships", "projects"
  add_foreign_key "project_memberships", "users"
  add_foreign_key "projects", "estimation_sessions"
  add_foreign_key "projects", "users"
  add_foreign_key "session_memberships", "estimation_sessions"
  add_foreign_key "session_memberships", "users"
  add_foreign_key "stories", "estimation_sessions"
end
