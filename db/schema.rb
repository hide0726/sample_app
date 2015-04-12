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

ActiveRecord::Schema.define(version: 20150409143221) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "abstract"
    t.text     "content"
    t.integer  "category_id"
    t.integer  "public"
    t.integer  "gentei"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["category_id", "public", "created_at"], name: "index_articles_on_category_id_and_public_and_created_at"

  create_table "entries", force: true do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.integer  "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["user_id", "micropost_id", "created_at"], name: "index_entries_on_user_id_and_micropost_id_and_created_at"

  create_table "microposts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "abstract"
    t.text     "content"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["category_id", "created_at"], name: "index_posts_on_category_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
