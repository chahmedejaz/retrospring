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

ActiveRecord::Schema.define(version: 20141207194424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.integer  "comment_count", default: 0, null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "smile_count",   default: 0, null: false
  end

  add_index "answers", ["user_id", "created_at"], name: "index_answers_on_user_id_and_created_at", using: :btree

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at", using: :btree

  create_table "inboxes", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "new"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "content"
    t.boolean  "author_is_anonymous"
    t.string   "author_name"
    t.string   "author_email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer_count",        default: 0, null: false
  end

  add_index "questions", ["user_id", "created_at"], name: "index_questions_on_user_id_and_created_at", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "source_id"
    t.integer  "target_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["source_id", "target_id"], name: "index_relationships_on_source_id_and_target_id", unique: true, using: :btree
  add_index "relationships", ["source_id"], name: "index_relationships_on_source_id", using: :btree
  add_index "relationships", ["target_id"], name: "index_relationships_on_target_id", using: :btree

  create_table "smiles", force: true do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "smiles", ["answer_id"], name: "index_smiles_on_answer_id", using: :btree
  add_index "smiles", ["user_id", "answer_id"], name: "index_smiles_on_user_id_and_answer_id", unique: true, using: :btree
  add_index "smiles", ["user_id"], name: "index_smiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "screen_name"
    t.integer  "friend_count",           default: 0,     null: false
    t.integer  "follower_count",         default: 0,     null: false
    t.integer  "asked_count",            default: 0,     null: false
    t.integer  "answered_count",         default: 0,     null: false
    t.integer  "commented_count",        default: 0,     null: false
    t.string   "display_name"
    t.integer  "smiled_count",           default: 0,     null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "motivation_header",      default: "",    null: false
    t.string   "website",                default: "",    null: false
    t.string   "location",               default: "",    null: false
    t.text     "bio",                    default: "",    null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["screen_name"], name: "index_users_on_screen_name", unique: true, using: :btree

end
