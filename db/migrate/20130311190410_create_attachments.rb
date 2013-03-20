class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :story
      t.string :url
      t.integer :pivotal_id
      t.string :filename
      t.references :user
      t.datetime :pivotal_uploaded_at

      t.timestamps
    end
    add_index :attachments, :story_id
    add_index :attachments, :pivotal_id
  end
end