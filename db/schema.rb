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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121019215854) do

  create_table "contents", :force => true do |t|
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "omniusers", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "question_choices", :force => true do |t|
    t.integer  "question_id"
    t.integer  "choice_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "question_contents", :force => true do |t|
    t.integer  "question_id"
    t.integer  "content_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "test_testquestions", :force => true do |t|
    t.integer  "test_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "test_testquestions", ["question_id"], :name => "index_test_testquestions_on_question_id", :unique => true
  add_index "test_testquestions", ["test_id"], :name => "index_test_testquestions_on_test_id", :unique => true

  create_table "testquestionchoices", :force => true do |t|
    t.text     "choices"
    t.boolean  "right"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "testquestions", :force => true do |t|
    t.integer  "kind"
    t.integer  "sub_kind"
    t.text     "question_body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tests", :force => true do |t|
    t.integer  "questions"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "omniuser_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wiki_wikipages", :force => true do |t|
    t.integer  "wiki_id"
    t.integer  "wikipage_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "wiki_wikipages", ["wiki_id"], :name => "index_wiki_wikipages_on_wiki_id", :unique => true
  add_index "wiki_wikipages", ["wikipage_id"], :name => "index_wiki_wikipages_on_wikipage_id", :unique => true

  create_table "wikipages", :primary_key => "page_id", :force => true do |t|
    t.integer  "owner_id",   :null => false
    t.string   "title",      :null => false
    t.text     "body",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wikis", :force => true do |t|
    t.string   "title",                         :null => false
    t.boolean  "close",      :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
