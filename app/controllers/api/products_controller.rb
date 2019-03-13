class Api::ProductsController < ApplicationController

  def index
    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end

    if params[:discount] == "true" 

      @products = @products.where("price < ?", 100)
    end

    if params[:sort] && params[:order]
      @products = @products.order(params[:sort] => params[:order])
    end
    render 'index.json.jbuilder'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id:the_id)
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(name: params[:input_name], price: params[:input_price], description: params[:input_description])

    @product.save
    render 'show.json.jbuilder'
  end

  def update 
    #find product
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    #update product
    @product.name = params[:name]
    @product.price = params[:price]
    @product.description = params[:description]
    @product.save
    render 'show.json.jbuilder'
  end

  def destroy
    # find product
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    # destory product
    @product.destroy
    render 'destroy.json.jbuilder'
  end
end





