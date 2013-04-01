class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.references :team
      t.datetime :start
      t.datetime :finish
      t.string :status

      t.timestamps
    end
    
    add_index :iterations, :team_id
    add_index :iterations, [:status, :team_id]
  end
end
