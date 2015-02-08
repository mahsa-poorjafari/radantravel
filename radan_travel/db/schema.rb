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

ActiveRecord::Schema.define(version: 20150208090629) do

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

  create_table "category_countries", force: true do |t|
    t.string   "title_en"
    t.string   "title_fa"
    t.string   "title_ar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "class_hotels", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "continent_categories", force: true do |t|
    t.string   "title_fa"
    t.string   "title_en"
    t.string   "title_ar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.integer  "set_order",         default: 0
  end

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
    t.integer  "continent_category_id"
    t.boolean  "show_in_submenu",           default: false
    t.integer  "category_country_id"
  end

  create_table "custom_tours", force: true do |t|
    t.string   "user_name"
    t.string   "user_email"
    t.string   "country"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visited",     default: false
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
    t.string   "hotel_facilities"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "class_hotels_id"
    t.integer  "class_hotel_id"
    t.integer  "hotel_type"
    t.boolean  "offer",            default: false
  end

  create_table "hotels_locationtours", force: true do |t|
    t.integer  "hotel_id"
    t.integer  "locationtour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investment_in_irans", force: true do |t|
    t.string   "title_en"
    t.string   "title_fa"
    t.string   "title_ar"
    t.text     "text_en"
    t.text     "text_fa"
    t.text     "text_ar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "iran_tour_reservs", force: true do |t|
    t.string   "fisrt_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "mobile"
    t.string   "fax"
    t.date     "start_date"
    t.boolean  "date_flexible", default: false
    t.integer  "adults_no"
    t.integer  "children_no"
    t.integer  "infants_no"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id"
    t.string   "track_code"
    t.boolean  "visited",       default: false
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

  create_table "locationtours", force: true do |t|
    t.integer  "hotel_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id"
    t.string   "price_two_bed"
    t.string   "price_one_bed"
    t.string   "price_kid_and_bed"
    t.string   "price_kid_without_bed"
    t.string   "description"
    t.string   "price_three_bed"
    t.integer  "row_position"
    t.string   "custom_hotel"
    t.integer  "set_order",             default: 100
  end

  create_table "locationtours_hotels", force: true do |t|
    t.integer  "hotel_id"
    t.integer  "locationtour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "visited",    default: false
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

  create_table "passengers", force: true do |t|
    t.string   "First_Name"
    t.string   "Last_Name"
    t.date     "Date_of_Birth"
    t.string   "Birth_Place"
    t.string   "Birth_other_Place"
    t.string   "Fathers_Name"
    t.string   "Grand_Fathers_Name"
    t.string   "Occupation"
    t.string   "Job_title"
    t.string   "Your_Company"
    t.string   "Nationality"
    t.string   "Previous_Nationality"
    t.string   "Passport_No"
    t.string   "Passport_type"
    t.string   "Date_Of_Passport_Issue"
    t.string   "Place_Of_Passport_Issue"
    t.date     "Date_Of_Passport_Expiry"
    t.string   "Where_collect_your_visa"
    t.string   "Phone_No"
    t.string   "Email"
    t.string   "Duration_Of_Stay_In_Iran"
    t.string   "Travel_Entrance_To_Iran"
    t.string   "Times_Have_You_Been_To_Iran"
    t.date     "date_of_Your_Last_Visit_To_Iran"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "visa_form_id"
    t.string   "gender"
    t.string   "Marital_status"
  end

  create_table "pdf_investments", force: true do |t|
    t.string   "title_en"
    t.string   "title_fa"
    t.string   "title_ar"
    t.text     "text_en"
    t.text     "text_fa"
    t.text     "text_ar"
    t.integer  "investment_in_iran_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf_file_file_name"
    t.string   "pdf_file_content_type"
    t.integer  "pdf_file_file_size"
    t.datetime "pdf_file_updated_at"
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

  create_table "send_links", force: true do |t|
    t.string   "sender_email"
    t.string   "receiver_email"
    t.string   "current_link"
    t.text     "text"
    t.string   "subject"
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
    t.string   "slide_type"
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
    t.integer  "continent_category_id"
    t.boolean  "special",                       default: false
    t.string   "source"
    t.string   "travel_type"
    t.string   "source_en"
    t.string   "travel_type_en"
    t.string   "source_ar"
    t.string   "travel_type_ar"
    t.string   "package_code"
    t.text     "tour_source"
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

  create_table "visa_forms", force: true do |t|
    t.string   "request_code"
    t.text     "visa_agreement"
    t.text     "important_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "I_agree"
    t.string   "Incoming_Flight_Departure_Airport"
    t.string   "Incoming_Flight_No"
    t.date     "Arrival_date"
    t.string   "Arrival_City"
    t.string   "Outgoing_Fligh_Destination"
    t.string   "Outgoing_Flight_No"
    t.date     "Departure_date"
    t.string   "Departure_City"
    t.boolean  "admin_visited",                     default: false
  end

  create_table "visa_types", force: true do |t|
    t.string   "title_en"
    t.string   "title_fa"
    t.string   "title_ar"
    t.text     "text_en"
    t.text     "text_fa"
    t.text     "text_ar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visas", force: true do |t|
    t.string   "title_en"
    t.string   "title_fa"
    t.string   "title_ar"
    t.text     "text_en"
    t.text     "text_fa"
    t.text     "text_ar"
    t.integer  "visa_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
