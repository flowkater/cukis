class CreateDayclasses < ActiveRecord::Migration
  def change
    create_table :dayclasses do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
