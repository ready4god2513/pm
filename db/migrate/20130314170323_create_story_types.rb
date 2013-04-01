class CreateStoryTypes < ActiveRecord::Migration
  def change
    create_table :story_types do |t|
      t.references :team
      t.string :name
      t.string :slug
      t.boolean :hidden, default: false
      t.integer :sort_order
      t.boolean :estimatable, default: true

      t.timestamps
    end
    
    add_index :story_types, :team_id
  end
end
