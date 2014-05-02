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

ActiveRecord::Schema.define(version: 20140502141822) do

  create_table "agents", force: true do |t|
    t.integer  "user_id"
    t.integer  "top_id"
    t.string   "contract_no"
    t.decimal  "commission_x",  precision: 8, scale: 2
    t.decimal  "commission_ya", precision: 8, scale: 2
    t.decimal  "commission_yb", precision: 8, scale: 2
    t.decimal  "commission_z",  precision: 8, scale: 2
    t.string   "a_type"
    t.boolean  "logo",                                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "courses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "name"
    t.text     "desc"
  end

  create_table "coursewares", force: true do |t|
    t.integer  "position"
    t.string   "name"
    t.text     "desc"
    t.string   "ppt_file_name"
    t.string   "ppt_content_type"
    t.integer  "ppt_file_size"
    t.datetime "ppt_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enroll_webexes", force: true do |t|
    t.integer  "user_id"
    t.integer  "schedule_id"
    t.integer  "enroll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.string   "status"
    t.string   "num_of_students"
    t.date     "start_date"
    t.integer  "start_hour"
    t.integer  "start_minute"
    t.integer  "duration"
    t.integer  "repeat_wday"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades_users", force: true do |t|
    t.integer  "grade_id"
    t.integer  "user_id"
    t.date     "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: true do |t|
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "url"
    t.text     "script"
    t.text     "desc"
  end

  create_table "schedules", force: true do |t|
    t.integer  "grade_id"
    t.integer  "teacher_id"
    t.string   "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "webex_no"
    t.string   "webex_pwd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agent_id"
    t.string   "u_type",                 default: "student"
    t.string   "login"
    t.string   "name"
    t.string   "qq"
    t.string   "weixin"
    t.string   "mobile"
    t.string   "parent_mobile"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_grades", force: true do |t|
    t.integer "user_id"
    t.integer "grade_id"
    t.date    "start_date"
    t.date    "end_date"
    t.integer "num_of_class"
  end

end
