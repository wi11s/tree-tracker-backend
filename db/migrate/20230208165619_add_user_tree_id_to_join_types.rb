class AddUserTreeIdToJoinTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :join_types, :user_tree_id, :integer
  end
end
