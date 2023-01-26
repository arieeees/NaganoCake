class Item < ApplicationRecord
    
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

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

  def is_active_method
    if is_active == true
      '販売中'
    else
      '販売停止中'
    end
  end
end