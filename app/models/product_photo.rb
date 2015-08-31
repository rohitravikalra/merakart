class ProductPhoto < ActiveRecord::Base
	belongs_to :product

	has_attached_file :photo, styles: { medium: "550x560>", thumb: "180x170>" }, default_url: "/assets/29.jpg"
end
