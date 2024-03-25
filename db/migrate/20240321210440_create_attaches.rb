class CreateAttaches < ActiveRecord::Migration[7.1]
  def change
    create_table :attaches do |t|
      t.references :project, null: false, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
