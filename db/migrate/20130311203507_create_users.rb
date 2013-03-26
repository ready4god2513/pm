class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :pivotal_id
      t.string :name
      t.string :email
      t.string :initials
      t.string :color
      t.string :slug
      t.boolean :hidden, default: false
      t.timestamps
    end
    
    add_index :users, :slug, unique: true
    add_index :users, :pivotal_id
    add_index :users, :email
  end
end