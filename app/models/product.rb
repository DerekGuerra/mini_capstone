class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images

  def is_discounted
    if price < 10 
      p "Item is on clearance"
    else
      p "Item is not on clearance"
    end
  end

  def tax
    price * 0.09
  end

  def sum
    price + tax
  end

  # validates :name, length: { maximum: 5 }
  # validates :price, presence: true 
end 
