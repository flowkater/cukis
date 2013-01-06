class CreateAttendships < ActiveRecord::Migration
  def change
    create_table :attendships do |t|
      t.integer :user_id
      t.integer :dayclass_id
      t.integer :paid, default: 0 # 0 - unpaid, 1 - paid, 2 - etc

      t.timestamps
    end
    add_index :attendships, :user_id
    add_index :attendships, :dayclass_id
    add_index :attendships, [:user_id, :dayclass_id], unique: true
  end
end
