class User < ApplicationRecord
    has_secure_password
    has_many :user_trees
    has_many :posts, dependent: :destroy
    has_many :join_types
    has_many :tree_types, through: :join_types

    validates :username, :name, :email, presence: true
    validates :username, :email, uniqueness: true

    has_many :received_requests, :class_name => "Request", :foreign_key => "receiver_id"
    has_many :sent_requests, :class_name => "Request", :foreign_key => "sender_id"

    has_many :friends, :class_name => "Friend", :foreign_key => "user1_id"

    def requests
        self.received_requests.map {|request| request.sender}
    end

    def friendships
        self.friends.map {|friend| friend.user2}
    end
end
