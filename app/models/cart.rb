class Cart < ApplicationRecord
  has_many :details
  has_many :items, through: :details
end
