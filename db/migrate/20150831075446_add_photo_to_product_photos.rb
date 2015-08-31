class AddPhotoToProductPhotos < ActiveRecord::Migration
  def change
  	add_attachment :product_photos, :photo
  end
end
