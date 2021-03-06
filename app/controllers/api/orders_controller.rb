class Api::OrdersController < ApplicationController
  
  def create
    # subtotal = quantity * price
    # product = Product.find_by(id: params[:product_id])
    # calculated_subtotal = params[:quantity].to_i * product.price
    # tax_rate = 0.09
    # calculated_tax = calculated_subtotal * tax_rate
    # calculated_total = calculated_subtotal + calculated_tax

    # @order = Order.new(
    #     user_id: current_user.id,
    #     product_id: params[:product_id],
    #     quantity: params[:quantity],
    #     subtotal: calculated_subtotal,
    #     tax: calculated_tax,
    #     total: calculated_total)

    # @order.save  
    # render 'show.json.jbuilder'

    @carted_products = current_user.carted_products
    @carted_products = @carted_products.where(status: "carted")

    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
        user_id: current_user.id,
        subtotal: calculated_subtotal, 
        tax: calculated_tax, 
        total: calculated_total, 
        )

    @order.save

    @carted_products.each do |carted_product|
      carted_product.order_id = @order_id
      carted_product.status = "purchased"
      carted_product.save
    end
    render 'show.json.jbuilder'
  end
end 
