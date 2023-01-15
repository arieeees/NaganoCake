class Address < ApplicationRecord
    
  belongs_to :customer

  validates :postal_code,  length: { minimum: 7, maximum: 7}, format: { with: /^[0-9]+$/, multiline: true}
  validates :name, presence: true
  validates :address, presence: true

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end


end