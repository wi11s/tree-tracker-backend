class CreateUserTrees < ActiveRecord::Migration[7.0]
  def change
    create_table :user_trees do |t|
      t.string :pet_name
      t.string :common_name
      t.string :scientific_name
      t.string :wiki
      t.string :image
      t.float :lat
      t.float :lng
      t.string :health
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
