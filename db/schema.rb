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

ActiveRecord::Schema.define(version: 20131213160951) do

  create_table "boards", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["user_id"], name: "index_boards_on_user_id"

  create_table "boardships", force: true do |t|
    t.integer  "board_id"
    t.integer  "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boardships", ["board_id", "follower_id"], name: "index_boardships_on_board_id_and_follower_id", unique: true
  add_index "boardships", ["board_id"], name: "index_boardships_on_board_id"
  add_index "boardships", ["follower_id"], name: "index_boardships_on_follower_id"

  create_table "comments", force: true do |t|
    t.integer  "pin_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["pin_id"], name: "index_comments_on_pin_id"

  create_table "friendships", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.boolean  "conformation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["sender_id", "receiver_id"], name: "index_friendships_on_sender_id_and_receiver_id", unique: true

  create_table "likeships", force: true do |t|
    t.integer  "user_id"
    t.integer  "pin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likeships", ["pin_id"], name: "index_likeships_on_pin_id"
  add_index "likeships", ["user_id", "pin_id"], name: "index_likeships_on_user_id_and_pin_id", unique: true
  add_index "likeships", ["user_id"], name: "index_likeships_on_user_id"

  create_table "pins", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pins", ["user_id", "created_at"], name: "index_pins_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name"

  create_table "tagships", force: true do |t|
    t.string   "pin_id"
    t.string   "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tagships", ["pin_id", "tag_id"], name: "index_tagships_on_pin_id_and_tag_id", unique: true
  add_index "tagships", ["pin_id"], name: "index_tagships_on_pin_id"
  add_index "tagships", ["tag_id"], name: "index_tagships_on_tag_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
