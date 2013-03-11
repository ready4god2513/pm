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

ActiveRecord::Schema.define(:version => 20130311190410) do

  create_table "attachments", :force => true do |t|
    t.integer  "story_id"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attachments", ["story_id"], :name => "index_attachments_on_story_id"

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

  add_index "integrations", ["project_id"], :name => "index_integrations_on_project_id"

  create_table "iterations", :force => true do |t|
    t.integer  "pivotal_id"
    t.datetime "start"
    t.datetime "finish"
    t.float    "team_strength"
    t.integer  "project_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "project_memberships", :force => true do |t|
    t.integer  "project_id"
    t.integer  "pivotal_id"
    t.string   "name"
    t.string   "email"
    t.string   "initials"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_memberships", ["project_id"], :name => "index_project_memberships_on_project_id"

  create_table "projects", :force => true do |t|
    t.integer  "pivotal_id"
    t.string   "name"
    t.integer  "iteration_length"
    t.string   "week_start"
    t.string   "point_scale"
    t.string   "velocity_scheme"
    t.string   "current_velocity"
    t.string   "initial_velocity"
    t.string   "number_of_done_iterations_to_show"
    t.string   "labels"
    t.string   "allow_attachments"
    t.string   "public"
    t.string   "use_https"
    t.string   "bugs_and_chores_are_estimatable"
    t.string   "commit_mode"
    t.string   "last_activity_at"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "stories", :force => true do |t|
    t.integer  "project_id"
    t.integer  "pivotal_id_id"
    t.string   "story_type"
    t.string   "url"
    t.integer  "estimate"
    t.string   "current_state"
    t.text     "description"
    t.string   "name"
    t.string   "requested_by"
    t.string   "owned_by"
    t.datetime "pivotal_created_at"
    t.datetime "pivotal_accepted_at"
    t.string   "labels"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "stories", ["pivotal_id_id"], :name => "index_stories_on_pivotal_id_id"
  add_index "stories", ["project_id"], :name => "index_stories_on_project_id"

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

end
