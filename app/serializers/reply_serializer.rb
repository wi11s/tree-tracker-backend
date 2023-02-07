class ReplySerializer < ActiveModel::Serializer
  attributes :id, :user, :content, :like_count, :reply_count
  has_one :user
  has_one :post
end
