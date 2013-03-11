class CreateProjectMemberships < ActiveRecord::Migration
  def change
    create_table :project_memberships do |t|
      t.references :project
      t.integer :pivotal_id
      t.string :name
      t.string :email
      t.string :initials
      t.string :role

      t.timestamps
    end
    add_index :project_memberships, :project_id
  end
end
