class MakeChangesToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :description, :text
    change_column :products, :price, :decimal, precision: 6, scale: 2
    add_column  :products, :in_stock, :string 
  end
end
