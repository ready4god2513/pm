class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :attachable, polymorphic: true
      t.string :file
      t.references :uploader

      t.timestamps
    end
    add_index :attachments, :attachable_id
  end
end