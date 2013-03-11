class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :pivotal_id
      t.string :name
      t.string :email
      t.string :initials

      t.timestamps
    end
  end
end
