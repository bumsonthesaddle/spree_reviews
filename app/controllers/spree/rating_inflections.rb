module Spree::RatingInflections
  def self.included klass
    klass.append_before_filter :initialize_rating, :only => :show
  end
  
  def initialize_rating
    current_user = try_spree_current_user
    @rating_review = Spree::Review.new if current_user.nil? or @product.nil?
    @rating_review = @product.reviews.find {|x| x.user == current_user} || Spree::Review.new
  end
end

