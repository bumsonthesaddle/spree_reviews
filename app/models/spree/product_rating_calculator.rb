module Spree::ProductRatingCalculator
  def recalculate_product_rating
    scope = product.reviews.reload
    unless Spree::Reviews::Config[:include_unapproved_reviews]
      scope = scope.approved
    end
    reviews_count = scope.count
    # reviews_count = product.reviews.reload.approved.count
    ratings_count = product.ratings.reload.count

    if reviews_count == 0 and ratings_count == 0
      product.update_attribute(:avg_rating, 0)
      return
    end

    ratings_from_reviews = scope.sum(:rating).to_f
    standalone_ratings = product.ratings.sum(:rating).to_f
    product.avg_rating = (ratings_from_reviews + standalone_ratings)/(reviews_count + ratings_count)
    product.reviews_count = reviews_count + ratings_count
    product.save
  end
end
