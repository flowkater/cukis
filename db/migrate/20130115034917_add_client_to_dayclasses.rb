class AddClientToDayclasses < ActiveRecord::Migration
  def change
  	add_column :dayclasses, :is_client, :boolean
    add_column :dayclasses, :client_profile, :string
    add_column :dayclasses, :client_schoollogo, :string
    add_column :dayclasses, :client_schoolname, :string
    add_column :dayclasses, :client_major, :string
    add_column :dayclasses, :client_name, :string
  end
end
