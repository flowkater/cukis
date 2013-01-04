class CreateAttendships < ActiveRecord::Migration
  def change
    create_table :attendships do |t|
      t.integer :user_id
      t.integer :dayclass_id

      t.timestamps
    end
    add_index :attendships, :user_id
    add_index :attendships, :dayclass_id
    add_index :attendships, [:user_id, :dayclass_id], unique: true
  end
end
