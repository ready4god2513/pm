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

ActiveRecord::Schema.define(:version => 20130314180529) do

  create_table "attachments", :force => true do |t|
    t.integer  "story_id"
    t.string   "url"
    t.integer  "pivotal_id"
    t.string   "filename"
    t.integer  "user_id"
    t.datetime "pivotal_uploaded_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "attachments", ["pivotal_id"], :name => "index_attachments_on_pivotal_id"
  add_index "attachments", ["story_id"], :name => "index_attachments_on_story_id"

  create_table "comments", :force => true do |t|
    t.integer  "story_id"
    t.integer  "pivotal_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "pivotal_created_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "comments", ["pivotal_id"], :name => "index_comments_on_pivotal_id"
  add_index "comments", ["story_id"], :name => "index_comments_on_story_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "integrations", :force => true do |t|
    t.integer  "project_id"
    t.integer  "pivotal_id"
    t.string   "type"
    t.string   "name"
    t.string   "field_name"
    t.string   "field_label"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "integrations", ["pivotal_id"], :name => "index_integrations_on_pivotal_id"
  add_index "integrations", ["project_id"], :name => "index_integrations_on_project_id"

  create_table "iterations", :force => true do |t|
    t.integer  "pivotal_id"
    t.integer  "project_id"
    t.integer  "number"
    t.datetime "start"
    t.datetime "finish"
    t.float    "team_strength"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "iterations", ["pivotal_id", "project_id"], :name => "index_iterations_on_pivotal_id_and_project_id"

  create_table "labels", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "labelable_id"
    t.string   "labelable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

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
    t.integer  "pivotal_id"
    t.string   "name"
    t.string   "slug"
    t.datetime "pivotal_created_at"
    t.integer  "version"
    t.integer  "iteration_length"
    t.string   "week_start_day"
    t.string   "point_scale"
    t.string   "account"
    t.datetime "first_iteration_start_time"
    t.integer  "current_iteration_number"
    t.boolean  "enable_tasks"
    t.string   "velocity_scheme"
    t.integer  "current_velocity"
    t.integer  "initial_velocity"
    t.integer  "number_of_done_iterations_to_show"
    t.boolean  "allow_attachments"
    t.boolean  "is_public"
    t.boolean  "use_https"
    t.boolean  "bugs_and_chores_are_estimatable"
    t.boolean  "commit_mode"
    t.datetime "pivotal_last_activity_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "projects", ["pivotal_id"], :name => "index_projects_on_pivotal_id"
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
    t.integer  "pivotal_id"
    t.string   "url"
    t.integer  "estimate"
    t.text     "description"
    t.string   "name"
    t.integer  "requestor_id"
    t.integer  "owner_id"
    t.datetime "pivotal_created_at"
    t.datetime "pivotal_accepted_at"
    t.datetime "pivotal_updated_at"
    t.string   "slug"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "stories", ["owner_id"], :name => "index_stories_on_owner_id"
  add_index "stories", ["pivotal_id"], :name => "index_stories_on_pivotal_id"
  add_index "stories", ["project_id"], :name => "index_stories_on_project_id"
  add_index "stories", ["requestor_id"], :name => "index_stories_on_requestor_id"
  add_index "stories", ["slug"], :name => "index_stories_on_slug", :unique => true
  add_index "stories", ["state_id"], :name => "index_stories_on_state_id"
  add_index "stories", ["story_type_id"], :name => "index_stories_on_story_type_id"

  create_table "story_types", :force => true do |t|
    t.integer  "team_id"
    t.string   "name"
    t.string   "slug"
    t.boolean  "hidden",     :default => false
    t.integer  "sort_order"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "story_types", ["team_id"], :name => "index_story_types_on_team_id"

  create_table "tasks", :force => true do |t|
    t.integer  "story_id"
    t.integer  "pivotal_id"
    t.text     "description"
    t.integer  "position"
    t.boolean  "complete"
    t.datetime "pivotal_created_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
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
    t.integer  "pivotal_id"
    t.string   "name"
    t.string   "email"
    t.string   "initials"
    t.string   "color"
    t.string   "slug"
    t.boolean  "hidden",     :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["pivotal_id"], :name => "index_users_on_pivotal_id"
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
