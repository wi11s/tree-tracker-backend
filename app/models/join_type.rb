class JoinType < ApplicationRecord
  belongs_to :user
  belongs_to :tree_type
  belongs_to :user_tree

  validates :user_id, uniqueness: { scope: [ :tree_type_id ] }
end
