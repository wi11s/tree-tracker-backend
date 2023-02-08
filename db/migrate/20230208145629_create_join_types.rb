class CreateJoinTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :join_types do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tree_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
