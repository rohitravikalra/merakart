class StaticPagesController < ApplicationController
  def home
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
  	else
  		@products = Product.where('sub_category like ?', @type).page(params[:page]).per_page(9)
  		@count = Product.where('sub_category like ?', @type).count
   	end
  end

end
