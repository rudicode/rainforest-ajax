class ReviewsController < ApplicationController

  before_filter :load_product, :ensure_loggedin

  def show
    @review = Review.find(params[:id])
  end

  def create

    @review = @product.reviews.build(review_params)
    # above is equivelent to below commented code.
    #   @review = Review.new( comment: params[:review][:comment],
    #                         product_id: @product.id,
    #                         user_id: current_user.id )
    @review.user = current_user
    
    if @review.save
      redirect_to product_path(@review.product_id), notice: "Review created successfully."
    else
      flash.now[:alert] = "Could not create Review."
      render 'products/show'
    end

  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

  def ensure_loggedin
    redirect_to new_session_path, notice: "Please login." unless current_user
  end

end
