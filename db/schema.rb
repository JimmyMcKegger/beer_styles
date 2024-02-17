# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_17_234227) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "style_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["style_id"], name: "index_likes_on_style_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "fermentation_type"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bjcp_category"
    t.string "slug"
    t.text "overall_impression"
    t.text "aroma"
    t.text "appearance"
    t.text "flavor"
    t.text "mouthfeel"
    t.text "history"
    t.text "comments"
    t.text "vital_statistics"
    t.text "commercial_examples"
    t.text "tags"
    t.integer "category_id"
    t.index ["category_id"], name: "index_styles_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "likes", "styles"
  add_foreign_key "likes", "users"
  add_foreign_key "styles", "categories"
end
