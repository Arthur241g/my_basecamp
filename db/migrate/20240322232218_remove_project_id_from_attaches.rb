class RemoveProjectIdFromAttaches < ActiveRecord::Migration[7.1]
  def change
    remove_column :attaches, :project_id, :integer
    #remove_index :attaches, :project_id
  end
end
