class CreateTasks < ActiveRecord::Migration
      
  def change
    create_table :tasks do |t|
      t.references :story
      t.references :owner
      t.references :requestor
      t.text :description
      t.integer :position
      t.boolean :complete

      t.timestamps
    end
    add_index :tasks, :story_id
  end
end
