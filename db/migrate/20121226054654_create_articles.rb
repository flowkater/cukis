class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :coverpic
      t.text :content
      t.references :schoolinfo
      t.boolean :approve, default: false
      t.boolean :spotlight, defailt: false

      t.timestamps
    end
  end
end
