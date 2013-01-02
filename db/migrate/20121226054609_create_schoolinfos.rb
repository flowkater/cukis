class CreateSchoolinfos < ActiveRecord::Migration
  def change
    create_table :schoolinfos do |t|
      t.string :maintitle #main Title
      t.string :subtitle #sub Title
      t.text :content #content
      t.string :logo #wide Image
      t.string :logoband #Band Image
      t.string :logocircle #Circle Logo Image
      t.string :logochart #Chart 

      t.timestamps
    end
  end
end
