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

ActiveRecord::Schema.define(:version => 20130403224507) do

  create_table "attachments", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "file"
    t.integer  "uploader_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "attachments", ["attachable_id"], :name => "index_attachments_on_attachable_id"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "comments", :force => true do |t|
    t.integer  "story_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["story_id"], :name => "index_comments_on_story_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "developers_stories", :id => false, :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "story_id", :null => false
  end

  add_index "developers_stories", ["user_id", "story_id"], :name => "index_developers_stories_on_user_id_and_story_id", :unique => true

  create_table "iterations", :force => true do |t|
    t.integer  "team_id"
    t.datetime "start"
    t.datetime "finish"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "iterations", ["status", "team_id"], :name => "index_iterations_on_status_and_team_id"
  add_index "iterations", ["team_id"], :name => "index_iterations_on_team_id"

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "labelable_id"
    t.string   "labelable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "managers_stories", :id => false, :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "story_id", :null => false
  end

  add_index "managers_stories", ["user_id", "story_id"], :name => "index_managers_stories_on_user_id_and_story_id", :unique => true

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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "projects", ["slug"], :name => "index_projects_on_slug", :unique => true
  add_index "projects", ["team_id"], :name => "index_projects_on_team_id"

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
    t.string   "iteration_start_day"
    t.string   "planning_mode"
    t.integer  "points_per_iteration"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
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
    t.string   "slug"
    t.integer  "priority"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.boolean  "completed",     :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "stories", ["project_id"], :name => "index_stories_on_project_id"
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

  create_table "teams_users", :id => false, :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "team_id", :null => false
  end

  add_index "teams_users", ["user_id", "team_id"], :name => "index_teams_users_on_user_id_and_team_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email",                  :default => "",    :null => false
    t.string   "color"
    t.string   "slug"
    t.boolean  "hidden",                 :default => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
