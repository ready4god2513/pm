class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :story
      t.text :text
      t.references :user

      t.timestamps
    end
    
    add_index :comments, :user_id
    add_index :comments, :story_id
  end
end
