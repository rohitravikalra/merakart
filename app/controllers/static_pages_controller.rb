class StaticPagesController < ApplicationController
  def home
  	@latest_products = Product.first(4)
  end

  def store_grid
  	@type = params[:type]
  	if @type == "all"
  		@products = Product.all.page(params[:page]).per_page(9)
  		@count = Product.all.count
  	elsif @type == "bags"
  		@products = Product.where('sub_category like ? or ?', @type, "purses").page(params[:page]).per_page(9)
  		@count = Product.where('sub_category like ? or ?', @type, "purses").count
  	elsif @type == "beauty"
  		@products = Product.where('sub_category like ? or ?', @type, "fragrance").page(params[:page]).per_page(9)
  		@count = Product.where('sub_category like ? or ?', @type, "fragrance").count
  	elsif @type == "all_acc"
  		@products = Product.where('sub_category like ? or ? or ? or ?',"bags", "hats", "beauty", "jewellery").page(params[:page]).per_page(9)
  		@count = Product.where('sub_category like ? or ? or ? or ?',"bags", "hats", "beauty", "jewellery").count
  		@type = "Accessories"
  	elsif @type == "men"
  		@products = Product.where(category: "M").page(params[:page]).per_page(9)
  		@count = Product.where(category: "M").count
		elsif @type == "women"
  		@products = Product.where(category: "F").page(params[:page]).per_page(9)
  		@count = Product.where(category: "F").count
  	else
  		@products = Product.where('sub_category like ?', @type).page(params[:page]).per_page(9)
  		@count = Product.where('sub_category like ?', @type).count
   	end
  end

  def product_page
  	@product = Product.find(params[:id])
  	@product_photos = @product.product_photos
  	@reviews = @product.reviews
  end

  def review
    @review = Review.new()
    @review.product_id = params[:id]
    @review.user_name = params[:name] 
    @review.email = params[:email]
    @review.review = params[:review]
    @review.rating = params[:rating]
    @review.save
    @count = Review.where(:product_id =>params[:id]).count
    @reviews = Review.where(:product_id =>params[:id])
    respond_to do |format|
        format.js { render :layout => false}
    end
  end

  def add_to_cart
  	session[:user_products] = Hash.new unless session[:user_products]
  	product = Product.find(params[:data_id])
  	session[:user_products]["#{product.id}##{params[:data_qty]}"] = product
  	respond_to do |format|
  		format.js { render :layout => false}
  	end
  end

  def checkout
  end

end
