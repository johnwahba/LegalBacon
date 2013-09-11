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

ActiveRecord::Schema.define(:version => 20130911185405) do

  create_table "citations", :force => true do |t|
    t.integer  "cited_case_id"
    t.integer  "citing_case_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "citations", ["cited_case_id"], :name => "index_citations_on_cited_case_id"
  add_index "citations", ["citing_case_id"], :name => "index_citations_on_citing_case_id"

  create_table "justices", :force => true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "wiki_link"
    t.string   "searchable_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "justices", ["searchable_name"], :name => "index_justices_on_searchable_name"

  create_table "opinion_types", :force => true do |t|
    t.string   "opinion_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "opinions", :force => true do |t|
    t.integer  "opinion_type_id"
    t.integer  "case_id"
    t.integer  "justice_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "opinions", ["case_id"], :name => "index_opinions_on_case_id"
  add_index "opinions", ["justice_id"], :name => "index_opinions_on_justice_id"
  add_index "opinions", ["opinion_type_id"], :name => "index_opinions_on_opinion_type_id"

  create_table "paragraphs", :force => true do |t|
    t.integer  "paragraph_index_number"
    t.text     "text"
    t.integer  "opinion_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "start_of_opinion",       :default => false
  end

  add_index "paragraphs", ["opinion_id"], :name => "index_paragraphs_on_opinion_id"

  create_table "scotus_cases", :force => true do |t|
    t.integer  "volume"
    t.integer  "start_page"
    t.date     "date_heard"
    t.string   "case_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "scotus_cases", ["volume", "start_page"], :name => "index_scotus_cases_on_volume_and_start_page"

end
