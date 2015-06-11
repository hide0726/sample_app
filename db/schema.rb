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

ActiveRecord::Schema.define(version: 20150611074601) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "abstract"
    t.text     "content"
    t.integer  "category_id"
    t.integer  "koukai"
    t.integer  "gentei"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "send_mail"
  end

  add_index "articles", ["category_id", "koukai", "created_at"], name: "index_articles_on_category_id_and_koukai_and_created_at"

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  add_index "comments", ["created_at"], name: "index_comments_on_created_at"

  create_table "contacts", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.integer  "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "entries", ["user_id", "micropost_id", "created_at"], name: "index_entries_on_user_id_and_micropost_id_and_created_at"

  create_table "messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["sender_id", "receiver_id", "created_at"], name: "index_messages_on_sender_id_and_receiver_id_and_created_at"

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

  create_table "profiles", force: true do |t|
    t.string   "shozoku"
    t.string   "gakukei"
    t.text     "self_intro"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "subemails", force: true do |t|
    t.string   "sub_email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inform"
  end

  create_table "tokens", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "uuid",       null: false
    t.datetime "expired_at", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.boolean  "created",         default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
