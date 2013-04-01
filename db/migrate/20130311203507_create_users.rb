class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :team
      t.string :name
      t.string :email
      t.string :color
      t.string :slug
      t.boolean :hidden, default: false
      t.timestamps
    end
    
    add_index :users, :team_id
    add_index :users, :slug, unique: true
    add_index :users, :email
  end
end