class Product < ApplicationRecord

  def is_discounted?
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
end
