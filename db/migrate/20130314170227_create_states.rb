class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.references :team
      t.integer :sort_order
      t.string :name
      t.string :slug

      t.timestamps
    end
    
    add_index :states, :team_id
  end
end
