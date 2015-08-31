task :refine_products => :environment do
  products = Product.where(:price => nil)
  products.each do |pro|
    pro.price = 15
    pro.save
  end
end

task :create_product_photos => :environment do
  products = Product.all
  products.each do |pro|
    # pro.product_photos.create(photo: '/assets/1.jpg')
    ProductPhoto.create(photo_file_name: '/assets/blog/16.jpg', product_id: pro.id)
    # pro.product_photos.create(photo: '/assets/2.jpg')
    ProductPhoto.create(photo_file_name: '/assets/blog/21.jpg', product_id: pro.id)
    # pro.product_photos.create(photo: '/assets/3.jpg')
    ProductPhoto.create(photo_file_name: '/assets/blog/17.jpg', product_id: pro.id)
    # pro.product_photos.create(photo: '/assets/4.jpg')
    ProductPhoto.create(photo_file_name: '/assets/blog/18.jpg', product_id: pro.id)
  end
end