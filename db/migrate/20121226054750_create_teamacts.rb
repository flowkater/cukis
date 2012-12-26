class CreateTeamacts < ActiveRecord::Migration
  def change
    create_table :teamacts do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
