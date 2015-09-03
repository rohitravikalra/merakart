class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zip
      t.string :state
      t.string :country

      t.timestamps null: false
    end
  end
end
