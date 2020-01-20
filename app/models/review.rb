class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :score, presence: true, numericality: {
    only_integer: true,
    allow_blank: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :text, length: {maximum: 500}
end
