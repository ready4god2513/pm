class CreateProjects < ActiveRecord::Migration

  def change
    create_table :projects do |t|
      t.integer :pivotal_id
      t.string :name
      t.string :account
      t.integer :iteration_length
      t.string :week_start_day
      t.string :point_scale
      t.string :velocity_scheme
      t.string :current_velocity
      t.string :initial_velocity
      t.integer :current_iteration_number
      t.datetime :first_iteration_start_time
      t.text :labels
      t.boolean :use_https
      t.datetime :last_activity_at
      t.references :team
      t.string :slug

      t.timestamps
    end

    add_index :projects, :team_id
    add_index :projects, :slug, unique: true
    add_index :projects, :pivotal_id
  end
end

