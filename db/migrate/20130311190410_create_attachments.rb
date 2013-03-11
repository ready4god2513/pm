class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :story
      t.string :url

      t.timestamps
    end
    add_index :attachments, :story_id
  end
end
