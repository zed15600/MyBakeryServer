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

ActiveRecord::Schema.define(version: 2021_03_15_050557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenditures", force: :cascade do |t|
    t.date "date"
    t.integer "total_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenditures_feedstocks", force: :cascade do |t|
    t.bigint "expenditure_id"
    t.bigint "feedstock_id"
    t.float "ammount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.index ["expenditure_id"], name: "index_expenditures_feedstocks_on_expenditure_id"
    t.index ["feedstock_id"], name: "index_expenditures_feedstocks_on_feedstock_id"
  end

  create_table "feedstocks", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_value"
    t.bigint "unit_id"
    t.bigint "provider_id"
    t.index ["provider_id"], name: "index_feedstocks_on_provider_id"
    t.index ["unit_id"], name: "index_feedstocks_on_unit_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "date"
    t.bigint "vendor_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hidden", default: false
    t.index ["vendor_id"], name: "index_payments_on_vendor_id"
  end

  create_table "production_stocks", force: :cascade do |t|
    t.bigint "production_id"
    t.bigint "stock_id"
    t.integer "quantity"
    t.bigint "unit_id"
    t.index ["production_id"], name: "index_production_stocks_on_production_id"
    t.index ["stock_id"], name: "index_production_stocks_on_stock_id"
    t.index ["unit_id"], name: "index_production_stocks_on_unit_id"
  end

  create_table "productions", force: :cascade do |t|
    t.bigint "product_id"
    t.date "date"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_productions_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pay_order"
    t.integer "stock", default: 0, null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "direction"
    t.integer "contact"
    t.boolean "deliver"
    t.integer "deliverCost"
    t.integer "deliverMinAmount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "stock_id"
    t.float "quantity"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recipe_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
    t.index ["stock_id"], name: "index_recipe_ingredients_on_stock_id"
    t.index ["unit_id"], name: "index_recipe_ingredients_on_unit_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id"
    t.integer "expected_quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_recipes_on_product_id"
  end

  create_table "sale_products", force: :cascade do |t|
    t.bigint "sale_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "paid_amount", default: 0
    t.index ["product_id"], name: "index_sale_products_on_product_id"
    t.index ["sale_id"], name: "index_sale_products_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.date "date"
    t.float "discount", default: 0.0, null: false
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_value"
    t.integer "vendors_profit", default: 0, null: false
    t.index ["vendor_id"], name: "index_sales_on_vendor_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.integer "quantity", default: 0, null: false
    t.integer "min_stock"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_stocks_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_units_on_unit_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.integer "profit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "debt", default: 0, null: false
  end

  add_foreign_key "expenditures_feedstocks", "expenditures"
  add_foreign_key "expenditures_feedstocks", "feedstocks"
  add_foreign_key "payments", "vendors"
  add_foreign_key "production_stocks", "productions"
  add_foreign_key "production_stocks", "stocks"
  add_foreign_key "production_stocks", "units"
  add_foreign_key "productions", "products"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipe_ingredients", "stocks"
  add_foreign_key "recipe_ingredients", "units"
  add_foreign_key "recipes", "products"
  add_foreign_key "sale_products", "products"
  add_foreign_key "sale_products", "sales"
  add_foreign_key "sales", "vendors"
  add_foreign_key "stocks", "units"
  add_foreign_key "units", "units"
end
