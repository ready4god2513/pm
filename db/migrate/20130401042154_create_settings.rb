class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :team
      t.integer :iteration_length
      t.string :iteration_start_day
      t.string :planning_mode
      t.integer :points_per_iteration
      t.string :estimates_available
      
      t.timestamps
    end
    add_index :settings, :team_id
  end
end
