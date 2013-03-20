class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :story
      t.integer :pivotal_id
      t.text :text
      t.references :user
      t.datetime :pivotal_created_at

      t.timestamps
    end
    
    add_index :comments, :user_id
    add_index :comments, :story_id
    add_index :comments, :pivotal_id
  end
end
