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

ActiveRecord::Schema.define(version: 20140926220819) do

  create_table "cleanups", force: true do |t|
    t.integer  "case_id"
    t.datetime "case_opened"
    t.datetime "case_closed"
    t.string   "status"
    t.string   "responsible_agency"
    t.string   "address"
    t.string   "category"
    t.string   "request_type"
    t.string   "request_details"
    t.string   "source"
    t.integer  "supervisor_district"
    t.string   "neighborhood"
    t.datetime "case_updated"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", force: true do |t|
    t.integer  "district_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supervisors", force: true do |t|
    t.integer  "district"
    t.string   "name"
    t.string   "phone_number"
    t.string   "facebook_url"
    t.string   "email"
    t.string   "website_url"
    t.string   "twitter"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
