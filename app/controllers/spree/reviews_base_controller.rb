class Spree::ReviewsBaseController < Spree::BaseController
  def load_product
    @product = Spree::Product.find_by_permalink!(params[:product_id])
  end
end
