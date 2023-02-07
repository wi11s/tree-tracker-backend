class JoinReplySerializer < ActiveModel::Serializer
  attributes :id, :parent_reply_id, :child_reply_id
end
