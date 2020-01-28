class Item < ApplicationRecord
    belongs_to :category, optional: true
    has_many :reviews

    class<<self
      def search(query)
        rel = order("id")
        if query.present?
          rel = rel.where("item_name LIKE ? OR item_details LIKE ?", "%#{query}%", "%#{query}%")
        end
        rel
      end
    end

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
