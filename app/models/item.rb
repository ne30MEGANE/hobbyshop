class Item < ApplicationRecord
    belongs_to :category

    validates :item_name, presence: true
    validates :stock, presence: true, 
      numericality: {
        only_integer: true,
        allow_blank: true,
        greater_than_or_equal_to: 0
      }
    validates :price, presence: true,
      numericality: {
          only_integer: true,
          allow_blank: true,
          greater_than: 0
      }
end
