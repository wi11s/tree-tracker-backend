class CreateUserTrees < ActiveRecord::Migration[7.0]
  def change
    create_table :user_trees do |t|
      t.text :pet_name
      t.text :common_name
      t.text :scientific_name
      t.text :wiki
      t.text :image
      t.float :lat
      t.float :lng
      t.text :health
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
