class AddSchoolinfoIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :schoolinfo_id, :integer
    add_index :users, :schoolinfo_id
  end
end
