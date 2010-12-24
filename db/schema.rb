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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101224044239) do

  create_table "payment_notifications", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "txn_id"
    t.string   "payer_email"
    t.string   "memo"
    t.string   "payment_date"
    t.string   "payment_type"
    t.integer  "quantity"
  end

  create_table "plans", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "subtitle"
    t.string   "target_title"
    t.string   "target_body",  :limit => 2000
    t.string   "financial",    :limit => 2000
    t.string   "status",       :limit => 1000
    t.string   "action"
    t.integer  "user_id"
    t.integer  "votes",                        :default => 0
  end

  create_table "schools", :force => true do |t|
    t.string "name"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "paid",            :default => "false"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "votes",           :default => 0
    t.string   "email"
    t.integer  "school_id"
  end

end
