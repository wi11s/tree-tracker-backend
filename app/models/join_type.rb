class JoinType < ApplicationRecord
  belongs_to :user
  belongs_to :tree_type
  belongs_to :user_tree
end
