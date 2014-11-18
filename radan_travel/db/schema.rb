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

ActiveRecord::Schema.define(version: 20141118103818) do

  create_table "ahoy_events", force: true do |t|
    t.uuid     "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time", using: :btree
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id", using: :btree
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.string   "title_ar"
    t.text     "text_fa"
    t.text     "text_en"
    t.text     "text_ar"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "countries", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.string   "title_ar"
    t.text     "text_fa"
    t.text     "text_en"
    t.text     "text_ar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_flag_file_name"
    t.string   "country_flag_content_type"
    t.integer  "country_flag_file_size"
    t.datetime "country_flag_updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "hotels", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.string   "title_ar"
    t.text     "text_fa"
    t.text     "text_en"
    t.text     "text_ar"
    t.integer  "city_id"
    t.integer  "hotel_grade"
    t.string   "hotel_facilities"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.string   "title_ar"
    t.string   "web_site"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "massages", force: true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "phone"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "phone"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.string   "title_ar"
    t.text     "text_fa"
    t.text     "text_en"
    t.text     "text_ar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "description_fa"
    t.string   "description_en"
    t.string   "description_ar"
    t.integer  "sight_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "tour_id"
    t.integer  "hotel_id"
    t.integer  "country_id"
    t.integer  "city_id"
  end

  create_table "planes", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.string   "title_ar"
    t.string   "text_fa"
    t.string   "text_en"
    t.string   "text_ar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sights", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.string   "title_ar"
    t.text     "text_fa"
    t.text     "text_en"
    t.text     "text_ar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  create_table "slides", force: true do |t|
    t.string   "text_fa"
    t.string   "text_en"
    t.string   "text_ar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "tour_comments", force: true do |t|
    t.string   "user_name"
    t.integer  "tour_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirm_comment", default: false
    t.string   "user_email"
  end

  create_table "tours", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.string   "title_ar"
    t.integer  "plane_id"
    t.integer  "hotel_id"
    t.integer  "country_id"
    t.integer  "city_id"
    t.integer  "price"
    t.date     "validate_date_from"
    t.date     "validate_date_until"
    t.boolean  "coming_soon",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description_fa"
    t.text     "description_en"
    t.text     "description_ar"
    t.text     "itinerary_fa"
    t.text     "itinerary_en"
    t.text     "itinerary_ar"
    t.text     "documents_fa"
    t.text     "documents_en"
    t.text     "documents_ar"
    t.string   "decription_image_file_name"
    t.string   "decription_image_content_type"
    t.integer  "decription_image_file_size"
    t.datetime "decription_image_updated_at"
    t.string   "info_file_name"
    t.string   "info_content_type"
    t.integer  "info_file_size"
    t.datetime "info_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: true do |t|
    t.uuid     "visitor_id"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

end
