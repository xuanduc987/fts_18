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

ActiveRecord::Schema.define(version: 20150324065730) do

  create_table "answers", force: :cascade do |t|
    t.integer  "examination_id", limit: 4
    t.integer  "option_id",      limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "question_id",    limit: 4
    t.string   "content",        limit: 255
    t.boolean  "correct",        limit: 1,   default: false
  end

  add_index "answers", ["examination_id"], name: "index_answers_on_examination_id", using: :btree
  add_index "answers", ["option_id"], name: "index_answers_on_option_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "examinations", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "status",     limit: 255, default: "waiting"
  end

  add_index "examinations", ["course_id"], name: "index_examinations_on_course_id", using: :btree
  add_index "examinations", ["user_id"], name: "index_examinations_on_user_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.string   "content",     limit: 255
    t.boolean  "correct",     limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "content",       limit: 65535
    t.integer  "course_id",     limit: 4
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "question_type", limit: 255,   default: "multiple_choice"
  end

  add_index "questions", ["course_id"], name: "index_questions_on_course_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255, default: "",       null: false
    t.string   "role",                   limit: 255, default: "normal"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "encrypted_password",     limit: 255, default: "",       null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "avatar",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "examinations"
  add_foreign_key "answers", "options"
  add_foreign_key "answers", "questions"
  add_foreign_key "examinations", "courses"
  add_foreign_key "examinations", "users"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "courses"
end
