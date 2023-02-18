class Request < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"

    validates :sender_id, presence: true
    validates :receiver_id, presence: true
  
    validates :sender_id, uniqueness: { scope: :receiver_id }
    validates :receiver_id, uniqueness: { scope: :sender_id }
end
