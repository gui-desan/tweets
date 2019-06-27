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

ActiveRecord::Schema.define(version: 2019_06_27_183132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "follows", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_follows_on_followee_id"
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "hash_tags", force: :cascade do |t|
    t.string "name"
    t.integer "tag_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_hash_tags_on_name"
  end

  create_table "hash_tags_tweets", id: false, force: :cascade do |t|
    t.bigint "tweet_id"
    t.bigint "hash_tag_id"
    t.index ["hash_tag_id"], name: "index_hash_tags_tweets_on_hash_tag_id"
    t.index ["tweet_id"], name: "index_hash_tags_tweets_on_tweet_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id"], name: "index_likes_on_tweet_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "requester_id"
    t.bigint "requestee_id"
    t.string "type", default: "0"
    t.string "smallint", default: "0"
    t.string "status", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requestee_id"], name: "index_relationships_on_requestee_id"
    t.index ["requester_id"], name: "index_relationships_on_requester_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "reply_id"
    t.bigint "retweet_id"
    t.string "content", limit: 256
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reply_id"], name: "index_tweets_on_reply_id"
    t.index ["retweet_id"], name: "index_tweets_on_retweet_id"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "firstname"
    t.string "lastname"
    t.integer "gender", limit: 2, default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "follows", "users", column: "followee_id", on_delete: :cascade
  add_foreign_key "follows", "users", column: "follower_id", on_delete: :cascade
  add_foreign_key "hash_tags_tweets", "hash_tags"
  add_foreign_key "hash_tags_tweets", "tweets", on_delete: :cascade
  add_foreign_key "likes", "tweets", on_delete: :cascade
  add_foreign_key "likes", "users", on_delete: :cascade
  add_foreign_key "relationships", "users", column: "requestee_id", on_delete: :cascade
  add_foreign_key "relationships", "users", column: "requester_id", on_delete: :cascade
  add_foreign_key "tweets", "tweets", column: "reply_id", on_delete: :cascade
  add_foreign_key "tweets", "tweets", column: "retweet_id", on_delete: :nullify
  add_foreign_key "tweets", "users", on_delete: :cascade
end
