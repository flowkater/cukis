class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title
      t.string :people
      t.string :price
      t.string :totalprice

      t.timestamps
    end
  end
end
