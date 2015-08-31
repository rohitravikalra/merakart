class Product < ActiveRecord::Base
	has_many :product_photos
	has_many :reviews
end
