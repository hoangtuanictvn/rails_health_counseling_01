class AddForeinKeyDisease < ActiveRecord::Migration[5.2]
  def change
    add_column :diseases, :category_id, :integer
  end
end
