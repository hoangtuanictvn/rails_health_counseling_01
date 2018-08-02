class AddBlockedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :block_status, :integer
  end
end
