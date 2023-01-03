# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_03_170413) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "birth_date"
    t.string "email"
    t.string "job_title"
    t.string "string"
    t.text "description"
    t.boolean "is_working"
    t.string "country"
    t.string "address"
    t.string "genre"
    t.text "logo"
    t.boolean "is_disabled_person"
    t.integer "expected_salary"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "applicant_id", null: false
    t.bigint "job_id", null: false
    t.datetime "application_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_job_applications_on_applicant_id"
    t.index ["job_id"], name: "index_job_applications_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.integer "salary"
    t.string "currency"
    t.datetime "publication_date"
    t.datetime "expiration_date"
    t.integer "minimum_experience"
    t.integer "maximum_experience"
    t.boolean "is_inclusive"
    t.integer "vacant_number"
    t.text "location"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_jobs_on_company_id"
  end

  add_foreign_key "job_applications", "applicants"
  add_foreign_key "job_applications", "jobs"
  add_foreign_key "jobs", "companies"
end
