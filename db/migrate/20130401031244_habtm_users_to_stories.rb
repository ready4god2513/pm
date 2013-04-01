class HabtmUsersToStories < ActiveRecord::Migration
  
  def change
    create_table :requestors_stories, :id => false do |t|
      t.references :user, :null => false
      t.references :story, :null => false
    end
    
    
    create_table :owners_stories, :id => false do |t|
      t.references :user, :null => false
      t.references :story, :null => false
    end

    add_index :owners_stories, [:user_id, :story_id], :unique => true
    add_index :requestors_stories, [:user_id, :story_id], :unique => true
  end
  
end