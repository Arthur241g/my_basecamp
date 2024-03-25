class AddUserIdToAttaches < ActiveRecord::Migration[7.1]
  def change
    add_column :attaches, :user_id, :integer
  end
end
