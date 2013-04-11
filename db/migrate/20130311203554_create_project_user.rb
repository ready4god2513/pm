class CreateProjectUser < ActiveRecord::Migration
  def change
    create_table :project_users, id: false do |t|
      t.references :project
      t.references :user

      t.timestamps
    end
    add_index :project_users, [:project_id, :user_id]
  end
end
