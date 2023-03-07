class TreeType < ApplicationRecord
    validates :common_name, uniqueness: true
    validates :common_name, :image, :frequency, presence: true

    has_many :join_types, dependent: :destroy
    has_many :users, through: :join_types
end
