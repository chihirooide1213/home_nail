class AddColumnToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :rate, :float
    add_column :comments, :content, :text
    add_column :comments, :title, :string
  end
end
