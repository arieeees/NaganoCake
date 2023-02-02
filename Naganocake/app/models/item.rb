class Item < ApplicationRecord
    
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  
  enum is_active: { on_sale: 0, discontinued: 1 }
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'      
    end
  end

  def with_tax_price
    (price * 1.1).floor
  end


end