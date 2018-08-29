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

ActiveRecord::Schema.define(version: 2018_08_29_034712) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.date "established"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_industries", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "industry_id", null: false
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
    t.index ["company_id"], name: "index_recruitments_on_company_id"
    t.index ["occupation_id"], name: "index_recruitments_on_occupation_id"
  end

  create_table "staffs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "company_id"
    t.string "family_name"
    t.string "first_name"
    t.string "password_digest"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_staffs_on_company_id"
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

  add_foreign_key "entry_sheets", "companies"
  add_foreign_key "entry_sheets", "occupations"
  add_foreign_key "entry_sheets", "recruitments"
  add_foreign_key "entry_sheets", "students"
  add_foreign_key "interests", "industries"
  add_foreign_key "interests", "occupations"
  add_foreign_key "interests", "students"
  add_foreign_key "recruitments", "companies"
  add_foreign_key "recruitments", "occupations"
  add_foreign_key "staffs", "companies"
end
