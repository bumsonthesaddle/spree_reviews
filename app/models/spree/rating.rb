class Spree::Rating < ActiveRecord::Base
  include Spree::ProductRatingCalculator
  #move this and review common code to a module
  belongs_to :user
  belongs_to :product
  after_save :recalculate_product_rating
  after_destroy :recalculate_product_rating
  validates_numericality_of :rating, :only_integer => true

  attr_protected :user_id,:product_id, :rating

  def self.create_using count, product, user
    rating = product.ratings.select {|x| x.user == user}.first
    rating = self.new unless rating
    rating.rating = count
    rating.user = user
    rating.product = product
    rating.save
  end
end
