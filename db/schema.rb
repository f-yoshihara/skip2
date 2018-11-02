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

ActiveRecord::Schema.define(version: 2018_10_25_080501) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.date "established"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "industry_id"
    t.index ["industry_id"], name: "index_companies_on_industry_id"
  end

  create_table "companies_industries", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "industry_id", null: false
  end

  create_table "employment_entries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recruitment_id"
    t.integer "status", default: 0, null: false
    t.text "answer1"
    t.text "answer2"
    t.text "answer3"
    t.text "answer4"
    t.text "answer5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruitment_id"], name: "index_employment_entries_on_recruitment_id"
    t.index ["user_id", "recruitment_id"], name: "index_employment_entries_on_user_id_and_recruitment_id", unique: true
    t.index ["user_id"], name: "index_employment_entries_on_user_id"
  end

  create_table "entries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recruitment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0, null: false
    t.text "answer1"
    t.text "answer2"
    t.text "answer3"
    t.text "answer4"
    t.text "answer5"
    t.index ["recruitment_id"], name: "index_entries_on_recruitment_id"
    t.index ["user_id", "recruitment_id"], name: "index_entries_on_user_id_and_recruitment_id", unique: true
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "entry_sheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "recruitment_id"
    t.integer "status", default: 0, null: false
    t.text "why"
    t.text "what"
    t.text "how"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "occupation_id"
    t.index ["company_id"], name: "index_entry_sheets_on_company_id"
    t.index ["occupation_id"], name: "index_entry_sheets_on_occupation_id"
    t.index ["recruitment_id"], name: "index_entry_sheets_on_recruitment_id"
    t.index ["student_id"], name: "index_entry_sheets_on_student_id"
  end

  create_table "industries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category"
    t.integer "interests_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "industry_id"
    t.bigint "occupation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["industry_id"], name: "index_interests_on_industry_id"
    t.index ["occupation_id"], name: "index_interests_on_occupation_id"
    t.index ["student_id"], name: "index_interests_on_student_id"
  end

  create_table "occupations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category"
    t.integer "interests_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruitments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "occupation_id"
    t.integer "status", default: 0, null: false
    t.string "title"
    t.text "body"
    t.date "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ctype"
    t.binary "photo", limit: 16777215
    t.integer "capacity"
    t.text "question1"
    t.text "question2"
    t.text "question3"
    t.text "question4"
    t.text "question5"
    t.string "prefecture"
    t.string "city"
    t.string "street"
    t.date "schedule"
    t.text "culture"
    t.time "start_time"
    t.string "belongings"
    t.string "clothing"
    t.text "notices"
    t.time "end_time"
    t.integer "category", default: 0, null: false
    t.index ["company_id"], name: "index_recruitments_on_company_id"
    t.index ["occupation_id"], name: "index_recruitments_on_occupation_id"
  end

  create_table "schools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.text "overview"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "nickname"
    t.string "email"
    t.string "url"
    t.string "image_url"
    t.string "description"
    t.text "other"
    t.text "credentials"
    t.text "raw_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_token"
    t.string "access_secret"
    t.index ["provider", "uid"], name: "index_social_profiles_on_provider_and_uid", unique: true
    t.index ["user_id"], name: "index_social_profiles_on_user_id"
  end

  create_table "staffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "company_id"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["company_id"], name: "index_staffs_on_company_id"
  end

  create_table "stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recruitment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruitment_id"], name: "index_stocks_on_recruitment_id"
    t.index ["user_id", "recruitment_id"], name: "index_stocks_on_user_id_and_recruitment_id", unique: true
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "family_name"
    t.string "first_name"
    t.string "password_digest"
    t.date "birthday"
    t.string "email"
    t.string "phone"
    t.boolean "dm"
    t.integer "school_year"
    t.string "school_name"
    t.integer "school_course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "school_id"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.date "birth"
    t.integer "school_year"
    t.string "school_name"
    t.string "email"
    t.bigint "school_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "companies", "industries"
  add_foreign_key "employment_entries", "recruitments"
  add_foreign_key "employment_entries", "users"
  add_foreign_key "entries", "recruitments"
  add_foreign_key "entries", "users"
  add_foreign_key "entry_sheets", "companies"
  add_foreign_key "entry_sheets", "occupations"
  add_foreign_key "entry_sheets", "recruitments"
  add_foreign_key "entry_sheets", "students"
  add_foreign_key "interests", "industries"
  add_foreign_key "interests", "occupations"
  add_foreign_key "interests", "students"
  add_foreign_key "recruitments", "companies"
  add_foreign_key "recruitments", "occupations"
  add_foreign_key "social_profiles", "users"
  add_foreign_key "staffs", "companies"
  add_foreign_key "stocks", "recruitments"
  add_foreign_key "stocks", "users"
  add_foreign_key "teachers", "schools"
  add_foreign_key "users", "schools"
end
