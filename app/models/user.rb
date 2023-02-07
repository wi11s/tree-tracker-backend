class User < ApplicationRecord
    has_secure_password
    has_many :user_trees

    validates :username, :name, :email, presence: true
    validates :username, :email, uniqueness: true

end
