class CreateRatings < ActiveRecord::Migration
  def change
    create_table :spree_ratings do |t|
      t.integer :product_id
      t.integer :rating
      t.integer :user_id 
      t.timestamps
    end
  end
end
