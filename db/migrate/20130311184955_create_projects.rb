class CreateProjects < ActiveRecord::Migration

  def change
    create_table :projects do |t|
      t.references :team
      t.integer :pivotal_id
      t.string :name
      t.string :slug
      t.datetime :pivotal_created_at
      t.integer :version
      t.integer :iteration_length
      t.string :week_start_day
      t.string :point_scale
      t.string :account
      t.datetime :first_iteration_start_time
      t.integer :current_iteration_number
      t.boolean :enable_tasks
      t.string :velocity_scheme
      t.integer :current_velocity
      t.integer :initial_velocity
      t.integer :number_of_done_iterations_to_show
      t.boolean :allow_attachments
      t.boolean :is_public
      t.boolean :use_https
      t.boolean :bugs_and_chores_are_estimatable
      t.boolean :commit_mode
      t.datetime :pivotal_last_activity_at

      t.timestamps
    end

    add_index :projects, :team_id
    add_index :projects, :slug, unique: true
    add_index :projects, :pivotal_id
  end
end

