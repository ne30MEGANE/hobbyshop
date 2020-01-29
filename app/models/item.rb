class Item < ApplicationRecord
  belongs_to :category, optional: true
  has_many :reviews
  has_one_attached :item_image
  attribute :new_item_image

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
  validate if: :new_item_image do
    if new_item_image.respond_to?(:content_type)
      unless new_item_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_item_image, :invalid_image_type)
      end
    else
      errors.add(:new_item_image, :invalid)
    end
  end
  
  before_save do
    if new_item_image
      self.item_image = new_item_image
    end
  end
end
