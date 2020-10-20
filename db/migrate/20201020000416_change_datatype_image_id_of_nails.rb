class ChangeDatatypeImageIdOfNails < ActiveRecord::Migration[5.2]
  def change
  	change_column :nails, :image_id, :string
  end
end
