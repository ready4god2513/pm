class HabtmUsersToStories < ActiveRecord::Migration
  
  def change
    create_table :managers_stories, :id => false do |t|
      t.references :user, :null => false
      t.references :story, :null => false
    end
    
    
    create_table :developers_stories, :id => false do |t|
      t.references :user, :null => false
      t.references :story, :null => false
    end

    add_index :managers_stories, [:user_id, :story_id], :unique => true
    add_index :developers_stories, [:user_id, :story_id], :unique => true
  end
  
end