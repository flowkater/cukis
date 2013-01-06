# encoding: UTF-8
class CreateGlobalinfos < ActiveRecord::Migration

	def migrate(direction)
    super
    # Create a globalinfo
    Globalinfo.create!(name: '이용약관', content: '이용약관') if direction == :up
    Globalinfo.create!(name: '개인정보', content: '개인정보') if direction == :up
  end

  def change
    create_table :globalinfos do |t|
    	t.string :name
      t.text :content

      t.timestamps
    end
  end
end
