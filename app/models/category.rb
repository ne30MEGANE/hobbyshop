class Category < ApplicationRecord
    has_many :items

    validates :category_name, uniqueness: true, presence: true,length: {minimum: 2, maximum: 20}
end
