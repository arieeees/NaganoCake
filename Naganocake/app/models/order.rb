class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_for_deposit: 0, payment_confirmation: 1, in_production: 2, ready_to_ship: 3, sent: 4 }
  validates :postal_code,  length: { minimum: 7, maximum: 7}, format: { with: /^[0-9]+$/, multiline: true}
  validates  :address, presence: true
  validates  :name, presence: true


  def ordered_itemes_total(order)
    array = []
    order.ordered_items.each do |ordered_item|
      array << ordered_item.amount
    end
    array.sum
  end
end