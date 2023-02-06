class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :user_trees
end
