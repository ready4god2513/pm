class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :color
      t.string :slug
      t.boolean :hidden, default: false
      t.timestamps
    end
    
    add_index :users, :slug, unique: true
    add_index :users, :email
    
    create_table :teams_users, :id => false do |t|
      t.references :user, :null => false
      t.references :team, :null => false
    end

    add_index :teams_users, [:user_id, :team_id], :unique => true
  end
end