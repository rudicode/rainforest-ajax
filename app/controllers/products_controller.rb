class ProductsController < ApplicationController
  def index
    if params[:search].blank?
      @products = Product.order(created_at: :desc).page(params[:page])
    else
      @products = Product.find_in_name_and_description(params[:search],params[:page])
    end

    respond_to do |format|
      # sleep(3)
      format.html
      format.js
    end

  end

  def show
    @product = Product.find(params[:id])
    if true #current_user
      @review = @product.reviews.build
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      logger.info "[Rainforest] Could not Create Product"
      render :new
    end

  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else
      logger.info "[Rainforest] Could not Update Product"
      render :edit
    end    

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
