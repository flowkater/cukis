class CreateSchoolinfos < ActiveRecord::Migration
  def change
    create_table :schoolinfos do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
