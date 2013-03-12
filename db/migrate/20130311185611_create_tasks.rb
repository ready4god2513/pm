class CreateTasks < ActiveRecord::Migration
      
  def change
    create_table :tasks do |t|
      t.references :story
      t.integer :pivotal_id
      t.text :description
      t.integer :position
      t.boolean :complete
      t.datetime :pivotal_created_at

      t.timestamps
    end
    add_index :tasks, :story_id
  end
end
