class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :color
      t.string :slug
      t.boolean :hidden, default: false

      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end
    
    add_index :users, :slug, unique: true
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true

    create_table :teams_users, :id => false do |t|
      t.references :user, :null => false
      t.references :team, :null => false
    end

    add_index :teams_users, [:user_id, :team_id], :unique => true

    create_table :projects_users, :id => false do |t|
      t.references :user, :null => false
      t.references :project, :null => false
    end

    add_index :projects_users, [:user_id, :project_id], :unique => true
  end
end