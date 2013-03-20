class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.integer :pivotal_id
      t.references :project
      t.integer :number
      t.datetime :start
      t.datetime :finish
      t.float :team_strength

      t.timestamps
    end
    
    add_index :iterations, [:pivotal_id, :project_id]
  end
end
