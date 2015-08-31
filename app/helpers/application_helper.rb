module ApplicationHelper

	def get_photo_url id
		photo = ProductPhoto.where(product_id: id)[0]
		phot_url = photo.photo_file_name
	end

	def get_the_subtotal
		subtotal = 0
		session[:user_products].each do |k,v|
			price = k.split('#')[1].to_i * v["price"]
			subtotal += price
		end
		return subtotal
	end

	def get_subtotal_for_product key
		price = session[:user_products][key]["price"]
		subtotal = price * key.split('#')[1].to_i
	end

end
