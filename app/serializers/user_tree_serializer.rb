class UserTreeSerializer < ActiveModel::Serializer
  attributes :id, :pet_name, :common_name, :scientific_name, :wiki, :image, :lat, :lng, :health, :description
  has_one :user
end
