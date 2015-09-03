class StaticPagesController < ApplicationController

  skip_before_filter :verify_authenticity_token

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

  def modify_cart
    @cart = false
    @cart = true if params[:type]
  	key = "#{params[:id]}##{params[:old_qty]}"
  	if params[:qty].to_i == 0
      old_qty = params[:old_qty].to_i
      while session[:user_products][key].blank?
        old_qty += 1
        key = "#{params[:id]}##{old_qty}"
      end
      session[:user_products].delete(key)
	  else
	  	new_key = "#{params[:id]}##{params[:qty]}"
	  	session[:user_products][new_key] = session[:user_products].delete(key)
	  end
	  respond_to do |format|
	  	format.js { render layout: false}
	  end
  end

  def place_order
    decoded = params[:order]
    begin
      decoded = URI.decode(decoded) 
    end while(decoded != URI.decode(decoded))
    decoded_arr = decoded.split('&')
    order = Hash.new
    decoded_arr.each do |ele|
      ele.gsub!('+', ' ')
      ele_arr = ele.split('=')
      order[ele_arr[0]] = ele_arr[1]
    end
    @order = Order.new(order)
    if @order.save
      session[:user_products] = nil
    end
    respond_to do |format|
    format.js {render layout: false}
    end
  end

  def queries
    @query = Query.new(query_params)
    if @query.save
      redirect_to root_path
    end
  end

  private
  def query_params
    params.require(:query).permit(:name, :email, :message)
  end

end
