class ProductsController < ApplicationController
  # GET /products
  def index
    render :json => Product.all
  end

  # GET /products/1
  def show
    render :json => Product.find(params[:id])
  end

  # POST /products
  def create
    @product = Product.new(params[:product])

    if @product.save
      render :json => @product, :status => :created, :location => @product
    else
      render :json => @product.errors, :status => :unprocessable_entity
    end
  end

  # PUT /products/1
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      head :ok
    else
      render :json => @product.errors, :status => :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    head :ok
  end
end
