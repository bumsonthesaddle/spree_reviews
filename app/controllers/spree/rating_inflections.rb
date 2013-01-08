module Spree::RatingInflections
  def self.included klass
    klass.append_before_filter :initialize_rating, :only => :show
  end
  
  def initialize_rating
    current_user = try_spree_current_user
    @rating = Spree::Rating.new if current_user.nil? or @product.nil?
    @rating = @product.ratings.find {|x| x.user == current_user} || Spree::Rating.new
  end
end

