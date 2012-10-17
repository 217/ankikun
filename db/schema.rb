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

ActiveRecord::Schema.define(:version => 20121017181829) do

  create_table "test_testquestions", :force => true do |t|
    t.integer  "test_id"
    t.integer  "testquestion_id"
    t.integer  "testquestionchoices_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "test_testquestions", ["test_id"], :name => "index_test_testquestions_on_test_id", :unique => true
  add_index "test_testquestions", ["testquestion_id"], :name => "index_test_testquestions_on_testquestion_id", :unique => true
  add_index "test_testquestions", ["testquestionchoices_id"], :name => "index_test_testquestions_on_testquestionchoices_id", :unique => true

  create_table "testquestionchoices", :force => true do |t|
    t.text     "choices"
    t.boolean  "right_anster"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
