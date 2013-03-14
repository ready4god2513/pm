class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :story
      t.integer :pivotal_id
      t.text :text
      t.references :user
      t.datetime :noted_at

      t.timestamps
    end
    
    add_index :notes, :user_id
    add_index :notes, :story_id
    add_index :notes, :pivotal_id
  end
end
