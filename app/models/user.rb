class User < ApplicationRecord
    has_secure_password
    has_many :user_trees
    has_many :posts, dependent: :destroy
    has_many :join_types
    has_many :tree_types, through: :join_types

    validates :username, :name, :email, presence: true
    validates :username, :email, uniqueness: true

    has_many :followings, :class_name => "Follow", :foreign_key => "follower_id"
    has_many :followeds, :class_name => "Follow", :foreign_key => "followed_id"

    def following
        self.followings.map {|follow| follow.followed}
    end

    def followers
        self.followeds.map {|follow| follow.follower}
    end
end
