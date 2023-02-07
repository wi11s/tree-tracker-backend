class TreeType < ApplicationRecord
    validates :common_name, uniqueness: true
    validates :common_name, :image, :frequency, presence: true
end
