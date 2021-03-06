# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150903194533) do

  create_table "orders", force: :cascade do |t|
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.string   "address1",   limit: 255
    t.string   "address2",   limit: 255
    t.string   "city",       limit: 255
    t.string   "zip",        limit: 255
    t.string   "state",      limit: 255
    t.string   "country",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "product_photos", force: :cascade do |t|
    t.integer  "product_id",         limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "category",     limit: 255
    t.string   "sub_category", limit: 255
    t.integer  "price",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "queries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "user_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "review",     limit: 255
    t.integer  "rating",     limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
