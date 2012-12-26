class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :repliable_id
      t.string :repliable_type

      t.timestamps
    end
    add_index :replies, [:repliable_id, :repliable_type]
  end
end
