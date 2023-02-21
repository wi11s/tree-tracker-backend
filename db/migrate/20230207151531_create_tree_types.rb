class CreateTreeTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :tree_types do |t|
      t.text :common_name
      t.text :image
      t.text :frequency

      t.timestamps
    end
  end
end
