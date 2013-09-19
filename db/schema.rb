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

ActiveRecord::Schema.define(version: 20130918230004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["id"], name: "index_comments_on_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "user_id",                        null: false
    t.integer  "friend_id",                      null: false
    t.string   "status",     default: "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "post_id"
    t.integer  "liker_id",   null: false
    t.integer  "comment_id"
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["id"], name: "index_likes_on_id", using: :btree
  add_index "likes", ["post_id"], name: "index_likes_on_post_id", using: :btree
  add_index "likes", ["value"], name: "index_likes_on_value", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id",                         null: false
    t.string   "title",                           null: false
    t.text     "text_field",                      null: false
    t.string   "post_type",  default: "standard"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["id"], name: "index_posts_on_id", using: :btree
  add_index "posts", ["post_type"], name: "index_posts_on_post_type", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                                  null: false
    t.text     "about"
    t.string   "password_digest",                       null: false
    t.string   "password_confirmation"
    t.string   "email",                                 null: false
    t.boolean  "status",                default: false
    t.integer  "friend_id"
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["id"], name: "index_users_on_id", using: :btree

end
