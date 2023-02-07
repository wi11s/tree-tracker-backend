class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :user_trees, :following, :posts, :followers
end
