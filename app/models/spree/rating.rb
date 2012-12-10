class Spree::Rating

  def initialize rating_count, product,user
    @rating_count = rating_count
    @product = product
    @user = user
  end

  def create
    @review = Spree::Review.find_by_product_id_and_user_id(@product.id, @user.id)
    @review = Spree::Review.new unless @review
    @review.rating = @rating_count
    @review.name = "BOTS-RATING"
    @review.review = "BOTS-RATING"
    @review.approved = true
    @review.product = @product
    @review.user = @user
    @review.save
  end
end
