class AddDoneToTruetasks < ActiveRecord::Migration[7.1]
  def change
    add_column :truetasks, :done, :boolean
  end
end
