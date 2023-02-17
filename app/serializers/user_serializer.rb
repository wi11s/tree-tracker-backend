class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :user_trees, :tree_types, :posts, :sent_requests, :requested, :requests
end
