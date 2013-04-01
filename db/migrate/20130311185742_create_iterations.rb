class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.references :team
      t.datetime :start
      t.datetime :finish
      t.boolean :current, default: false
      t.boolean :future, default: false
      t.boolean :past, default: false

      t.timestamps
    end
    
    add_index :iterations, :team_id
  end
end
