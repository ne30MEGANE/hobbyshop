class Order < ApplicationRecord
    belongs_to :user, optional: true
    has_many :details
    has_many :items, through: :details
end
