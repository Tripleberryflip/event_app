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

ActiveRecord::Schema.define(:version => 20130427195510) do

  create_table "competitors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "score_sheet_id"
    t.integer  "event_id"
  end

  create_table "event_coordinators", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "event_id"
    t.string   "password_digest"
    t.string   "email"
    t.string   "remember_coordinator"
  end

  add_index "event_coordinators", ["remember_coordinator"], :name => "index_event_coordinators_on_remember_coordinator"

  create_table "event_judges", :force => true do |t|
    t.integer  "event_id"
    t.integer  "judge_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "event_coordinator_id"
    t.integer  "score_template_id"
    t.integer  "judge_id"
    t.integer  "competitor_id"
  end

  create_table "events_judges", :force => true do |t|
    t.integer  "event_id"
    t.integer  "judge_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "judges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "score_sheet_id"
    t.integer  "event_id"
    t.string   "password_digest"
    t.string   "email"
    t.string   "remember_judge"
  end

  add_index "judges", ["remember_judge"], :name => "index_judges_on_remember_judge"

  create_table "question_score_templates", :force => true do |t|
    t.integer  "question_id"
    t.integer  "score_template_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "max_value"
    t.integer  "score_template_id"
  end

  create_table "questions_score_templates", :force => true do |t|
    t.integer  "question_id"
    t.integer  "score_template_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "score_sheets", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "judge_id"
    t.integer  "event_id"
    t.integer  "competitor_id"
  end

  create_table "score_templates", :force => true do |t|
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "score_sheet_id"
    t.integer  "question_id"
    t.integer  "event_id"
  end

  create_table "scores", :force => true do |t|
    t.integer  "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "question_id"
    t.integer  "score_sheet_id"
  end

end
