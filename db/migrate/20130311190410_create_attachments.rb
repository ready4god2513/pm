class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :story
      t.string :url
      t.integer :pivotal_id
      t.string :filename
      t.text :description
      t.string :uploaded_by
      t.datetime :uploaded_at
      t.string :status

      t.timestamps
    end
    add_index :attachments, :story_id
  end
end