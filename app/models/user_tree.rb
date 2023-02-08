class UserTree < ApplicationRecord
  belongs_to :user
  has_one :join_type, dependent: :destroy
end
