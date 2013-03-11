class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.references :project
      t.references :pivotal_id
      t.string :story_type
      t.string :url
      t.integer :estimate
      t.string :current_state
      t.text :description
      t.string :name
      t.string :requested_by
      t.string :owned_by
      t.datetime :pivotal_created_at
      t.datetime :pivotal_accepted_at
      t.string :labels

      t.timestamps
    end
    add_index :stories, :project_id
    add_index :stories, :pivotal_id_id
  end
end
