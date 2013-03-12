class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.references :project
      t.integer :pivotal_id
      t.string :type
      t.string :name
      t.string :field_name
      t.string :field_label
      t.boolean :active

      t.timestamps
    end
    add_index :integrations, :project_id
    add_index :integrations, :pivotal_id
  end
end
