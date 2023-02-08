class TreeTypeSerializer < ActiveModel::Serializer
  attributes :id, :common_name, :image, :frequency, :collected
end
