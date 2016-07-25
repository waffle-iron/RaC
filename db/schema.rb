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

ActiveRecord::Schema.define(version: 20160725072216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreement_zone_extras", force: :cascade do |t|
    t.integer  "agreement_zone_id"
    t.integer  "extra_id"
    t.boolean  "bill_ttoo"
    t.boolean  "bill_client"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "agreement_id"
  end

  add_index "agreement_zone_extras", ["agreement_id"], name: "index_agreement_zone_extras_on_agreement_id", using: :btree
  add_index "agreement_zone_extras", ["agreement_zone_id"], name: "index_agreement_zone_extras_on_agreement_zone_id", using: :btree
  add_index "agreement_zone_extras", ["extra_id"], name: "index_agreement_zone_extras_on_extra_id", using: :btree

  create_table "agreement_zone_group_sections", force: :cascade do |t|
    t.integer  "agreement_zone_id"
    t.integer  "section"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "agreement_id"
    t.integer  "section_to"
  end

  add_index "agreement_zone_group_sections", ["agreement_id"], name: "index_agreement_zone_group_sections_on_agreement_id", using: :btree
  add_index "agreement_zone_group_sections", ["agreement_zone_id"], name: "index_agreement_zone_group_sections_on_agreement_zone_id", using: :btree

  create_table "agreement_zone_groups", force: :cascade do |t|
    t.integer  "agreement_zone_id"
    t.string   "group"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "agreement_id"
  end

  add_index "agreement_zone_groups", ["agreement_id"], name: "index_agreement_zone_groups_on_agreement_id", using: :btree
  add_index "agreement_zone_groups", ["agreement_zone_id"], name: "index_agreement_zone_groups_on_agreement_zone_id", using: :btree

  create_table "agreement_zone_insurances", force: :cascade do |t|
    t.integer  "agreement_zone_id"
    t.integer  "insurance_id"
    t.boolean  "bill_ttoo"
    t.boolean  "bill_client"
    t.boolean  "commisionable"
    t.boolean  "confidential"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "agreement_id"
  end

  add_index "agreement_zone_insurances", ["agreement_id"], name: "index_agreement_zone_insurances_on_agreement_id", using: :btree
  add_index "agreement_zone_insurances", ["agreement_zone_id"], name: "index_agreement_zone_insurances_on_agreement_zone_id", using: :btree
  add_index "agreement_zone_insurances", ["insurance_id"], name: "index_agreement_zone_insurances_on_insurance_id", using: :btree

  create_table "agreement_zone_taxes", force: :cascade do |t|
    t.integer  "agreement_zone_id"
    t.integer  "tax_id"
    t.boolean  "bill_ttoo"
    t.boolean  "bill_client"
    t.boolean  "commisionable"
    t.boolean  "confidential"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "agreement_id"
  end

  add_index "agreement_zone_taxes", ["agreement_id"], name: "index_agreement_zone_taxes_on_agreement_id", using: :btree
  add_index "agreement_zone_taxes", ["agreement_zone_id"], name: "index_agreement_zone_taxes_on_agreement_zone_id", using: :btree
  add_index "agreement_zone_taxes", ["tax_id"], name: "index_agreement_zone_taxes_on_tax_id", using: :btree

  create_table "agreement_zones", force: :cascade do |t|
    t.integer  "agreement_id"
    t.integer  "zone_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "agreement_zones", ["agreement_id"], name: "index_agreement_zones_on_agreement_id", using: :btree
  add_index "agreement_zones", ["zone_id"], name: "index_agreement_zones_on_zone_id", using: :btree

  create_table "agreements", force: :cascade do |t|
    t.integer  "company_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.decimal  "commission_base"
  end

  add_index "agreements", ["company_id"], name: "index_agreements_on_company_id", using: :btree

  create_table "booking_insurances", force: :cascade do |t|
    t.integer  "rate_group_insurance_cost_id"
    t.integer  "booking_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "booking_insurances", ["booking_id"], name: "index_booking_insurances_on_booking_id", using: :btree
  add_index "booking_insurances", ["rate_group_insurance_cost_id"], name: "index_booking_insurances_on_rate_group_insurance_cost_id", using: :btree

  create_table "booking_rate_extras", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "rate_extra_id"
    t.integer  "booking_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "booking_rate_extras", ["booking_id"], name: "index_booking_rate_extras_on_booking_id", using: :btree
  add_index "booking_rate_extras", ["rate_extra_id"], name: "index_booking_rate_extras_on_rate_extra_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.datetime "delivery_date"
    t.string   "delivery_location"
    t.integer  "days_number"
    t.string   "return_location"
    t.integer  "ttoo_id"
    t.integer  "rac_id"
    t.string   "booking_number"
    t.string   "external_reference"
    t.integer  "place_type_id"
    t.string   "place_name"
    t.string   "fly_room"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "agreement_zone_id"
    t.integer  "rate_group_id"
    t.datetime "return_date"
  end

  add_index "bookings", ["agreement_zone_id"], name: "index_bookings_on_agreement_zone_id", using: :btree
  add_index "bookings", ["place_type_id"], name: "index_bookings_on_place_type_id", using: :btree
  add_index "bookings", ["rate_group_id"], name: "index_bookings_on_rate_group_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "tradename"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "provincecountry"
    t.string   "fax"
    t.string   "email"
    t.string   "phone"
    t.integer  "company_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "companies", ["company_type_id"], name: "index_companies_on_company_type_id", using: :btree

  create_table "company_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "treatment_type_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "nationality_id"
    t.integer  "booking_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "customers", ["booking_id"], name: "index_customers_on_booking_id", using: :btree
  add_index "customers", ["nationality_id"], name: "index_customers_on_nationality_id", using: :btree
  add_index "customers", ["treatment_type_id"], name: "index_customers_on_treatment_type_id", using: :btree

  create_table "extras", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insurances", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nationalities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rate_extras", force: :cascade do |t|
    t.integer  "rate_id"
    t.integer  "agreement_zone_extra_id"
    t.decimal  "cost"
    t.decimal  "max_cost"
    t.boolean  "include_in_cost"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "rate_extras", ["agreement_zone_extra_id"], name: "index_rate_extras_on_agreement_zone_extra_id", using: :btree
  add_index "rate_extras", ["rate_id"], name: "index_rate_extras_on_rate_id", using: :btree

  create_table "rate_group_insurance_costs", force: :cascade do |t|
    t.integer  "rate_group_insurance_id"
    t.integer  "agreement_zone_insurance_id"
    t.decimal  "cost"
    t.boolean  "include_in_cost"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "rate_group_insurance_costs", ["agreement_zone_insurance_id"], name: "index_rate_group_insurance_costs_on_agreement_zone_insurance_id", using: :btree
  add_index "rate_group_insurance_costs", ["rate_group_insurance_id"], name: "index_rate_group_insurance_costs_on_rate_group_insurance_id", using: :btree

  create_table "rate_group_insurances", force: :cascade do |t|
    t.integer  "rate_id"
    t.integer  "agreement_zone_group_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "rate_group_insurances", ["agreement_zone_group_id"], name: "index_rate_group_insurances_on_agreement_zone_group_id", using: :btree
  add_index "rate_group_insurances", ["rate_id"], name: "index_rate_group_insurances_on_rate_id", using: :btree

  create_table "rate_groups", force: :cascade do |t|
    t.integer  "rate_id"
    t.integer  "agreement_zone_group_id"
    t.integer  "agreement_zone_group_section_id"
    t.decimal  "cost"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "rate_groups", ["agreement_zone_group_id"], name: "index_rate_groups_on_agreement_zone_group_id", using: :btree
  add_index "rate_groups", ["agreement_zone_group_section_id"], name: "index_rate_groups_on_agreement_zone_group_section_id", using: :btree
  add_index "rate_groups", ["rate_id"], name: "index_rate_groups_on_rate_id", using: :btree

  create_table "rate_taxes", force: :cascade do |t|
    t.integer  "rate_id"
    t.integer  "agreement_zone_tax_id"
    t.decimal  "cost"
    t.boolean  "include_in_cost"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "rate_taxes", ["agreement_zone_tax_id"], name: "index_rate_taxes_on_agreement_zone_tax_id", using: :btree
  add_index "rate_taxes", ["rate_id"], name: "index_rate_taxes_on_rate_id", using: :btree

  create_table "rates", force: :cascade do |t|
    t.string   "code"
    t.date     "from"
    t.date     "to"
    t.boolean  "is_active"
    t.boolean  "is_offer",          default: true
    t.decimal  "commission_base"
    t.integer  "agreement_zone_id"
    t.integer  "agreement_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "sale_type_id"
  end

  add_index "rates", ["agreement_id"], name: "index_rates_on_agreement_id", using: :btree
  add_index "rates", ["agreement_zone_id"], name: "index_rates_on_agreement_zone_id", using: :btree
  add_index "rates", ["sale_type_id"], name: "index_rates_on_sale_type_id", using: :btree

  create_table "sale_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatment_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "dni"
    t.string   "phone"
    t.string   "fax"
    t.string   "mobile"
    t.string   "address"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_zone_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "zones", ["parent_zone_id"], name: "index_zones_on_parent_zone_id", using: :btree

  add_foreign_key "agreement_zone_extras", "agreement_zones"
  add_foreign_key "agreement_zone_extras", "agreements"
  add_foreign_key "agreement_zone_extras", "extras"
  add_foreign_key "agreement_zone_group_sections", "agreement_zones"
  add_foreign_key "agreement_zone_group_sections", "agreements"
  add_foreign_key "agreement_zone_groups", "agreement_zones"
  add_foreign_key "agreement_zone_groups", "agreements"
  add_foreign_key "agreement_zone_insurances", "agreement_zones"
  add_foreign_key "agreement_zone_insurances", "agreements"
  add_foreign_key "agreement_zone_insurances", "insurances"
  add_foreign_key "agreement_zone_taxes", "agreement_zones"
  add_foreign_key "agreement_zone_taxes", "agreements"
  add_foreign_key "agreement_zone_taxes", "taxes"
  add_foreign_key "agreement_zones", "agreements"
  add_foreign_key "agreement_zones", "zones"
  add_foreign_key "agreements", "companies"
  add_foreign_key "booking_insurances", "bookings"
  add_foreign_key "booking_insurances", "rate_group_insurance_costs"
  add_foreign_key "booking_rate_extras", "bookings"
  add_foreign_key "booking_rate_extras", "rate_extras"
  add_foreign_key "bookings", "agreement_zones"
  add_foreign_key "bookings", "place_types"
  add_foreign_key "bookings", "rate_groups"
  add_foreign_key "bookings", "users"
  add_foreign_key "companies", "company_types"
  add_foreign_key "customers", "bookings"
  add_foreign_key "customers", "nationalities"
  add_foreign_key "customers", "treatment_types"
  add_foreign_key "rate_extras", "agreement_zone_extras"
  add_foreign_key "rate_extras", "rates"
  add_foreign_key "rate_group_insurance_costs", "agreement_zone_insurances"
  add_foreign_key "rate_group_insurance_costs", "rate_group_insurances"
  add_foreign_key "rate_group_insurances", "agreement_zone_groups"
  add_foreign_key "rate_group_insurances", "rates"
  add_foreign_key "rate_groups", "agreement_zone_group_sections"
  add_foreign_key "rate_groups", "agreement_zone_groups"
  add_foreign_key "rate_groups", "rates"
  add_foreign_key "rate_taxes", "agreement_zone_taxes"
  add_foreign_key "rate_taxes", "rates"
  add_foreign_key "rates", "agreement_zones"
  add_foreign_key "rates", "agreements"
  add_foreign_key "rates", "sale_types"
end
