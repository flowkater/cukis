class AddDatetimeToDayclasses < ActiveRecord::Migration
  def change
    add_column :dayclasses, :fromdatetime, :datetime
    add_column :dayclasses, :enddatetime, :datetime
  end
end
