class Spree::RatingsController < Spree::ReviewsBaseController
  before_filter :load_product, :only => [:create]

  def create
    /^\s*(\d+).*?$/.match(params[:review][:rating])
    rating_count = $1.to_i
    @rating = Spree::Rating.new(rating_count, @product, try_spree_current_user)
    @rating.create
    redirect_to (product_path(@product))
  end
end
