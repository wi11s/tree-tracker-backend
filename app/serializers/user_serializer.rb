class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :user_trees, :tree_types, :following, :posts, :followers
end
