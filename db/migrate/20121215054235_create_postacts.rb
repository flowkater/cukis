class CreatePostacts < ActiveRecord::Migration
  def change
    create_table :postacts do |t|
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
