class CreateDayclasses < ActiveRecord::Migration
  def change
    create_table :dayclasses do |t|
      t.string :title
      t.text :content
      t.float :fee
      t.integer :minnumber
      t.integer :maxnumber
      t.date :fromdate
      t.date :enddate
      t.time :fromtime
      t.time :endtime
      t.string :doc
      t.string :place
      t.references :client
      t.boolean :approve, default: false

      t.timestamps
    end
  end
end
