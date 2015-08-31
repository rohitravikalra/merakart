class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.string :user_name
    	t.string :email
    	t.string :review
    	t.integer :rating
    	t.integer :product_id
    	
      t.timestamps null: false
    end
  end
end
