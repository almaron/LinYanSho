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

ActiveRecord::Schema.define(version: 20140526150056) do

  create_table "admin_configs", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_configs", ["name"], name: "index_admin_configs_on_name", unique: true, using: :btree

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", unique: true, using: :btree

  create_table "blog_comments", force: true do |t|
    t.integer  "blog_post_id", null: false
    t.text     "comment"
    t.integer  "user_id"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_posts", force: true do |t|
    t.string   "head"
    t.text     "text"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "char_delegations", force: true do |t|
    t.integer  "char_id",                null: false
    t.integer  "user_id",                null: false
    t.date     "ending"
    t.integer  "owner",      default: 0
    t.integer  "default",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "char_delegations", ["user_id"], name: "index_char_delegations_on_user_id", using: :btree

  create_table "char_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "char_profiles", force: true do |t|
    t.integer  "char_id",                null: false
    t.string   "birth_date"
    t.integer  "age"
    t.integer  "season_id"
    t.string   "place"
    t.string   "beast"
    t.text     "phisics"
    t.text     "bio"
    t.text     "look"
    t.text     "character"
    t.text     "items"
    t.string   "person"
    t.text     "comment"
    t.integer  "points",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "char_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chars", force: true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.string   "status_line"
    t.string   "avatar"
    t.integer  "status_id"
    t.integer  "open_player"
    t.integer  "profile_topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guest_posts", force: true do |t|
    t.string   "head"
    t.text     "content"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user",       null: false
    t.string   "ip",         null: false
  end

  create_table "log_types", force: true do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "author"
    t.string   "head"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "head"
    t.string   "page_title"
    t.string   "page_alias"
    t.string   "ancestry"
    t.text     "content"
    t.string   "partial"
    t.string   "partial_params"
    t.integer  "published",        default: 0
    t.integer  "hide_menu",        default: 0
    t.integer  "sorting",          default: 0
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["ancestry"], name: "index_pages_on_ancestry", using: :btree
  add_index "pages", ["page_alias"], name: "index_pages_on_page_alias", unique: true, using: :btree

  create_table "season_times", force: true do |t|
    t.integer  "season_id"
    t.integer  "begins"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "season_times", ["begins"], name: "index_season_times_on_begins", using: :btree

  create_table "seasons", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_profiles", force: true do |t|
    t.integer  "user_id",                  null: false
    t.string   "full_name"
    t.date     "birth_date"
    t.string   "icq"
    t.string   "skype"
    t.string   "contacts"
    t.integer  "viewcontacts", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                                             null: false
    t.string   "email",                                            null: false
    t.string   "group",                           default: "user"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end