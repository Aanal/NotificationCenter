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

ActiveRecord::Schema.define(version: 20150403140217) do

  create_table "intermediateones", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "messages_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "intermediateones", ["messages_id"], name: "index_intermediateones_on_messages_id"
  add_index "intermediateones", ["user_id"], name: "index_intermediateones_on_user_id"

  create_table "messages", force: :cascade do |t|
    t.string   "Title"
    t.text     "Text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages_users", id: false, force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages_users", ["message_id"], name: "index_messages_users_on_message_id"
  add_index "messages_users", ["user_id"], name: "index_messages_users_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.string   "Title"
    t.text     "Text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "Name"
    t.string   "Discipline"
    t.string   "Specialisation"
    t.integer  "Student_ID"
    t.string   "Batch"
    t.string   "College"
    t.string   "Year_of_Exam"
    t.string   "Phone_Number"
    t.string   "Stream"
    t.string   "Course"
    t.string   "City"
    t.string   "Center"
    t.string   "Email_Address"
    t.string   "GCM_RegID"
    t.boolean  "Student",          default: false
    t.boolean  "Faculty",          default: false
    t.boolean  "CenterAdmin",      default: false
    t.boolean  "Redirector",       default: false
    t.boolean  "Registered",       default: false
    t.string   "Password"
    t.integer  "messagesend_id"
    t.string   "messagesend_type"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "hashed_password"
    t.string   "confirm_token"
    t.string   "type"
    t.boolean  "email_confirmed",  default: false
  end

  add_index "users", ["messagesend_type", "messagesend_id"], name: "index_users_on_messagesend_type_and_messagesend_id"

end
