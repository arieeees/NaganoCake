class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :amount, format: { with: /^[0-9]+$/, multiline: true }, presence: true
end
