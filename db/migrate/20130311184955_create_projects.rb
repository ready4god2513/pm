class CreateProjects < ActiveRecord::Migration

  def change
    create_table :projects do |t|
      t.references :team
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_index :projects, :team_id
    add_index :projects, :slug, unique: true
  end
end

