class AddRequestedColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :requested, :boolean
  end
end
