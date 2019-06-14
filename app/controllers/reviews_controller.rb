class ReviewsController < ApplicationController
  before_filter :authorize

  def create

    @product = Product.find(params['product_id'])
    
    @review = @product.reviews.create product_id: params['product_id'], rating: params['review']['rating'], description: params['review']['description'], user: current_user

    if @review.valid?
      redirect_to @product
    else
      redirect_to @product
    end

  end
end
