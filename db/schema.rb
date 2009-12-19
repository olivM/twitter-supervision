# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091216205355) do

  create_table "options", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "term_tweets", :force => true do |t|
    t.integer  "term_id"
    t.integer  "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", :force => true do |t|
    t.string   "name"
    t.integer  "last_page",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.integer  "twitter_id",        :limit => 8
    t.string   "text"
    t.string   "message"
    t.string   "geo"
    t.string   "from_user"
    t.integer  "from_user_id",      :limit => 8
    t.string   "to_user"
    t.integer  "to_user_id",        :limit => 8
    t.string   "profile_image_url"
    t.string   "source"
    t.string   "iso_language_code"
    t.datetime "sent_at"
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
