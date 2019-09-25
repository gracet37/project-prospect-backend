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

ActiveRecord::Schema.define(version: 2019_09_25_202530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "status"
    t.bigint "leadnote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leadnote_id"], name: "index_comments_on_leadnote_id"
  end

  create_table "leadlists", force: :cascade do |t|
    t.bigint "lead_id"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_leadlists_on_lead_id"
    t.index ["list_id"], name: "index_leadlists_on_list_id"
  end

  create_table "leadnotes", force: :cascade do |t|
    t.string "status"
    t.string "next_steps"
    t.bigint "lead_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_leadnotes_on_lead_id"
    t.index ["user_id"], name: "index_leadnotes_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.string "company"
    t.string "company_industry"
    t.string "company_size"
    t.integer "confidence_score"
    t.string "website"
    t.string "phone_number"
    t.string "linkedin"
    t.date "contacted_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "leadnotes"
  add_foreign_key "leadlists", "leads"
  add_foreign_key "leadlists", "lists"
  add_foreign_key "leadnotes", "leads"
  add_foreign_key "leadnotes", "users"
  add_foreign_key "lists", "users"
end
