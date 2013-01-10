class AddAttrToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :name, :string
    add_column :questions, :phone, :string
    add_column :questions, :email, :string
  end
end
