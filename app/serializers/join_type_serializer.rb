class JoinTypeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :tree_type

  validates :user_id, uniqueness: { scope: [ :tree_type_id ] }
end
