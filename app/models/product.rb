class Product < ApplicationRecord

  def is_discounted?
    if price < 10 
      p "Item is on clearance"
    else
      p "Item is not on clearance"
    end
  end

  def tax
    product_taxed = price * 1.09
    p "Total price with tax is #{product_taxed}"
  end
end
