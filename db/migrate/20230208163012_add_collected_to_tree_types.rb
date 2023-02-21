class AddCollectedToTreeTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :tree_types, :collected, :text
  end
end
