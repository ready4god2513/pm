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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130401042154) do

  create_table "attachments", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "file"
    t.integer  "uploader_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "attachments", ["attachable_id"], :name => "index_attachments_on_attachable_id"

  create_table "comments", :force => true do |t|
    t.integer  "story_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["story_id"], :name => "index_comments_on_story_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "iterations", :force => true do |t|
    t.integer  "team_id"
    t.datetime "start"
    t.datetime "finish"
    t.boolean  "current",    :default => false
    t.boolean  "future",     :default => false
    t.boolean  "past",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "iterations", ["current", "team_id"], :name => "index_iterations_on_current_and_team_id"
  add_index "iterations", ["future", "team_id"], :name => "index_iterations_on_future_and_team_id"
  add_index "iterations", ["past", "team_id"], :name => "index_iterations_on_past_and_team_id"
  add_index "iterations", ["team_id"], :name => "index_iterations_on_team_id"

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "labelable_id"
    t.string   "labelable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "owners_stories", :id => false, :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "story_id", :null => false
  end

  add_index "owners_stories", ["user_id", "story_id"], :name => "index_owners_stories_on_user_id_and_story_id", :unique => true

  create_table "project_users", :force => true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_users", ["project_id"], :name => "index_project_users_on_project_id"
  add_index "project_users", ["user_id"], :name => "index_project_users_on_user_id"

  create_table "projects", :force => true do |t|
    t.integer  "team_id"
    t.string   "name"
    t.string   "slug"
    t.string   "point_scale"
    t.string   "account"
    t.boolean  "enable_tasks"
    t.boolean  "is_public"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "projects", ["slug"], :name => "index_projects_on_slug", :unique => true
  add_index "projects", ["team_id"], :name => "index_projects_on_team_id"

  create_table "requestors_stories", :id => false, :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "story_id", :null => false
  end

  add_index "requestors_stories", ["user_id", "story_id"], :name => "index_requestors_stories_on_user_id_and_story_id", :unique => true

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "settings", :force => true do |t|
    t.integer  "team_id"
    t.integer  "iteration_length"
    t.string   "planning_mode"
    t.integer  "points"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "settings", ["team_id"], :name => "index_settings_on_team_id"

  create_table "states", :force => true do |t|
    t.integer  "team_id"
    t.integer  "sort_order"
    t.string   "name"
    t.string   "slug"
    t.boolean  "hidden",     :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "states", ["team_id"], :name => "index_states_on_team_id"

  create_table "stories", :force => true do |t|
    t.integer  "project_id"
    t.integer  "iteration_id"
    t.integer  "story_type_id"
    t.integer  "state_id"
    t.integer  "estimate"
    t.text     "description"
    t.string   "name"
    t.integer  "requestor_id"
    t.integer  "owner_id"
    t.string   "slug"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "stories", ["owner_id"], :name => "index_stories_on_owner_id"
  add_index "stories", ["project_id"], :name => "index_stories_on_project_id"
  add_index "stories", ["requestor_id"], :name => "index_stories_on_requestor_id"
  add_index "stories", ["slug"], :name => "index_stories_on_slug", :unique => true
  add_index "stories", ["state_id"], :name => "index_stories_on_state_id"
  add_index "stories", ["story_type_id"], :name => "index_stories_on_story_type_id"

  create_table "story_types", :force => true do |t|
    t.integer  "team_id"
    t.string   "name"
    t.string   "slug"
    t.boolean  "hidden",      :default => false
    t.integer  "sort_order"
    t.boolean  "estimatable", :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "story_types", ["team_id"], :name => "index_story_types_on_team_id"

  create_table "tasks", :force => true do |t|
    t.integer  "story_id"
    t.integer  "owner_id"
    t.integer  "requestor_id"
    t.text     "description"
    t.integer  "position"
    t.boolean  "complete"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "tasks", ["story_id"], :name => "index_tasks_on_story_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "key"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "teams", ["slug"], :name => "index_teams_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "color"
    t.string   "slug"
    t.boolean  "hidden",     :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
