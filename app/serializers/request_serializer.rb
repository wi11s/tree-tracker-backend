class RequestSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :receiver_id
end
