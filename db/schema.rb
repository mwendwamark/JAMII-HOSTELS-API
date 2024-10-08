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

ActiveRecord::Schema[7.1].define(version: 2024_09_14_092525) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "student_id", null: false
    t.bigint "hostel_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostel_id"], name: "index_bookings_on_hostel_id"
    t.index ["student_id"], name: "index_bookings_on_student_id"
  end

  create_table "hostels", force: :cascade do |t|
    t.bigint "landlord_id", null: false
    t.string "hostel_name"
    t.string "location"
    t.float "price_per_month"
    t.string "hostel_type"
    t.boolean "toilet"
    t.boolean "kitchen"
    t.boolean "wifi"
    t.boolean "study_room"
    t.boolean "balcony"
    t.boolean "gym"
    t.boolean "wardrobe"
    t.boolean "laundry_services"
    t.integer "avaliable_units"
    t.boolean "parking"
    t.string "room_type"
    t.boolean "hot_shower"
    t.boolean "garden"
    t.boolean "swimming_pool"
    t.boolean "air_conditioner"
    t.boolean "cctv_cameras"
    t.boolean "fire_extinguishers"
    t.boolean "first_aid_kits"
    t.boolean "smoke_alarm"
    t.text "description"
    t.string "water_supply"
    t.boolean "buy_own_tokens"
    t.boolean "fully_furnished"
    t.boolean "security"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_id"], name: "index_hostels_on_landlord_id"
  end

  create_table "landlords", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "hostel_id", null: false
    t.bigint "student_id", null: false
    t.text "comments"
    t.integer "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostel_id"], name: "index_reviews_on_hostel_id"
    t.index ["student_id"], name: "index_reviews_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "hostels"
  add_foreign_key "bookings", "students"
  add_foreign_key "hostels", "landlords"
  add_foreign_key "reviews", "hostels"
  add_foreign_key "reviews", "students"
end
