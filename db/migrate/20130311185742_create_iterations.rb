class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.integer :pivotal_id
      t.datetime :start
      t.datetime :finish
      t.float :team_strength
      t.references :project

      t.timestamps
    end
    
    add_index :iterations, :pivotal_id
  end
end
