class CreateTreeTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :tree_types do |t|
      t.string :common_name
      t.string :image
      t.string :frequency

      t.timestamps
    end
  end
end
