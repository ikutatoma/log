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

ActiveRecord::Schema.define(version: 2020_07_26_054716) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.string "title"
    t.string "content"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "course_questions", force: :cascade do |t|
    t.integer "course_id"
    t.integer "question_id"
    t.index ["course_id"], name: "index_course_questions_on_course_id"
    t.index ["question_id"], name: "index_course_questions_on_question_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "questions_id"
    t.index ["questions_id"], name: "index_courses_on_questions_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.index ["question_id"], name: "index_likes_on_question_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "date"
    t.integer "user_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_questions_on_course_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest", null: false
    t.string "password"
    t.string "password_confirmation"
    t.string "simple_word"
    t.string "color"
    t.string "place"
    t.integer "question_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["question_id"], name: "index_users_on_question_id"
  end

  create_table "users_courses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_users_courses_on_course_id"
    t.index ["user_id"], name: "index_users_courses_on_user_id"
  end

end
