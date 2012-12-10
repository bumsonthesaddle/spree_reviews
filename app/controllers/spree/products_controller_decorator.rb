Spree::ProductsController.class_eval do
  include Spree::RatingInflections
  helper Spree::ReviewsHelper
end
