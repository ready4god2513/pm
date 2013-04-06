class CreateStories < ActiveRecord::Migration
  
  def change
    create_table :stories do |t|
      t.references :project
      t.references :iteration
      t.references :story_type
      t.references :state
      t.integer :estimate
      t.text :description
      t.string :name
      t.references :requestor
      t.references :owner
      t.string :slug
      t.integer :priority
      t.timestamps
    end
    
    add_index :stories, :project_id
    add_index :stories, :requestor_id
    add_index :stories, :owner_id
    add_index :stories, :story_type_id
    add_index :stories, :state_id
    add_index :stories, :slug, unique: true
  end
end
