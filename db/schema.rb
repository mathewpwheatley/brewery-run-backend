# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_14_200914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.string "brewery_type"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "longitude"
    t.string "latitude"
    t.string "phone"
    t.string "website_url"
    t.text "tag_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "breweries_circuits", id: false, force: :cascade do |t|
    t.bigint "brewery_id", null: false
    t.bigint "circuit_id", null: false
    t.index ["brewery_id", "circuit_id"], name: "index_breweries_circuits_on_brewery_id_and_circuit_id"
    t.index ["circuit_id", "brewery_id"], name: "index_breweries_circuits_on_circuit_id_and_brewery_id"
  end

  create_table "brewery_favorites", force: :cascade do |t|
    t.bigint "brewery_id", null: false
    t.bigint "user_id", null: false
    t.index ["brewery_id", "user_id"], name: "index_brewery_favorites_on_brewery_id_and_user_id", unique: true
    t.index ["brewery_id"], name: "index_brewery_favorites_on_brewery_id"
    t.index ["user_id"], name: "index_brewery_favorites_on_user_id"
  end

  create_table "brewery_likes", force: :cascade do |t|
    t.bigint "brewery_id", null: false
    t.bigint "user_id", null: false
    t.index ["brewery_id", "user_id"], name: "index_brewery_likes_on_brewery_id_and_user_id", unique: true
    t.index ["brewery_id"], name: "index_brewery_likes_on_brewery_id"
    t.index ["user_id"], name: "index_brewery_likes_on_user_id"
  end

  create_table "brewery_reviews", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.integer "rating", default: 5, null: false
    t.bigint "brewery_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brewery_id"], name: "index_brewery_reviews_on_brewery_id"
    t.index ["user_id"], name: "index_brewery_reviews_on_user_id"
  end

  create_table "circuit_favorites", force: :cascade do |t|
    t.bigint "circuit_id", null: false
    t.bigint "user_id", null: false
    t.index ["circuit_id", "user_id"], name: "index_circuit_favorites_on_circuit_id_and_user_id", unique: true
    t.index ["circuit_id"], name: "index_circuit_favorites_on_circuit_id"
    t.index ["user_id"], name: "index_circuit_favorites_on_user_id"
  end

  create_table "circuit_likes", force: :cascade do |t|
    t.bigint "circuit_id", null: false
    t.bigint "user_id", null: false
    t.index ["circuit_id", "user_id"], name: "index_circuit_likes_on_circuit_id_and_user_id", unique: true
    t.index ["circuit_id"], name: "index_circuit_likes_on_circuit_id"
    t.index ["user_id"], name: "index_circuit_likes_on_user_id"
  end

  create_table "circuit_reviews", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.integer "rating", default: 5, null: false
    t.bigint "circuit_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["circuit_id"], name: "index_circuit_reviews_on_circuit_id"
    t.index ["user_id"], name: "index_circuit_reviews_on_user_id"
  end

  create_table "circuits", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.boolean "public", default: false, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_circuits_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "followee_id", null: false
    t.bigint "follower_id", null: false
    t.index ["followee_id", "follower_id"], name: "index_follows_on_followee_id_and_follower_id", unique: true
    t.index ["followee_id"], name: "index_follows_on_followee_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.string "link"
    t.boolean "read", default: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "middle_name", null: false
    t.string "last_name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "about"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "brewery_favorites", "breweries", on_delete: :cascade
  add_foreign_key "brewery_favorites", "users", on_delete: :cascade
  add_foreign_key "brewery_likes", "breweries", on_delete: :cascade
  add_foreign_key "brewery_likes", "users", on_delete: :cascade
  add_foreign_key "brewery_reviews", "breweries", on_delete: :cascade
  add_foreign_key "brewery_reviews", "users", on_delete: :cascade
  add_foreign_key "circuit_favorites", "circuits", on_delete: :cascade
  add_foreign_key "circuit_favorites", "users", on_delete: :cascade
  add_foreign_key "circuit_likes", "circuits", on_delete: :cascade
  add_foreign_key "circuit_likes", "users", on_delete: :cascade
  add_foreign_key "circuit_reviews", "circuits", on_delete: :cascade
  add_foreign_key "circuit_reviews", "users", on_delete: :cascade
  add_foreign_key "circuits", "users", on_delete: :cascade
  add_foreign_key "follows", "users", column: "followee_id", on_delete: :cascade
  add_foreign_key "follows", "users", column: "follower_id", on_delete: :cascade
  add_foreign_key "notifications", "users", on_delete: :cascade
end
