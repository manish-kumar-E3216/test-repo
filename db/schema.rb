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

ActiveRecord::Schema.define(version: 20191211114619) do

  create_table "food_category_lists", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "foodcategory_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "foodcategories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "foodlists", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "food_id"
    t.string   "cityinfo_id"
    t.integer  "foodcost"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "foodcategory_id"
  end

  create_table "foods", force: :cascade do |t|
    t.integer  "foodcategory_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "orderdetails", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "food_id"
    t.integer  "restaurant_id"
    t.integer  "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date"
    t.string   "cityinfo_id"
    t.string   "address"
    t.string   "comments"
    t.integer  "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email"

end