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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111207121318) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_nutrients", :force => true do |t|
    t.float    "amount"
    t.integer  "food_id"
    t.integer  "nutrient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "food_nutrients", ["food_id", "nutrient_id"], :name => "index_food_nutrients_on_food_id_and_nutrient_id", :unique => true

  create_table "foods", :force => true do |t|
    t.string   "name"
    t.float    "amount"
    t.float    "calories"
    t.float    "fat_calories"
    t.integer  "food_group_id"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "foods", ["food_group_id"], :name => "index_foods_on_food_group_id"
  add_index "foods", ["unit_id"], :name => "index_foods_on_unit_id"

  create_table "nutrients", :force => true do |t|
    t.string   "name"
    t.string   "abbv"
    t.float    "daily_base"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nutrients", ["unit_id"], :name => "index_nutrients_on_unit_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "upc"
    t.float    "amount"
    t.integer  "food_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["food_id"], :name => "index_products_on_food_id"

  create_table "units", :force => true do |t|
    t.string   "name"
    t.string   "abbv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
