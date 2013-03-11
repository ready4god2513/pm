class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :pivotal_id
      t.string :name
      t.integer :iteration_length
      t.string :week_start
      t.string :point_scale
      t.string :velocity_scheme
      t.string :current_velocity
      t.string :initial_velocity
      t.string :number_of_done_iterations_to_show
      t.string :labels
      t.string :allow_attachments
      t.string :public
      t.string :use_https
      t.string :bugs_and_chores_are_estimatable
      t.string :commit_mode
      t.string :last_activity_at
      t.references :team

      t.timestamps
    end
  end
end
