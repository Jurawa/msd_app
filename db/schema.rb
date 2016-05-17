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

ActiveRecord::Schema.define(version: 20160517081717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "firm"
    t.string   "department"
    t.boolean  "resident"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operation_records", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "primary_surgeon_id"
    t.integer  "anesthesiologist_id"
    t.date     "operation_date"
    t.string   "pre_op_diagnosis"
    t.string   "post_op_diagnosis"
    t.string   "procedures",                       array: true
    t.string   "case_type"
    t.boolean  "reoperation"
    t.integer  "duration"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "operation_records", ["anesthesiologist_id"], name: "index_operation_records_on_anesthesiologist_id", using: :btree
  add_index "operation_records", ["patient_id"], name: "index_operation_records_on_patient_id", using: :btree
  add_index "operation_records", ["primary_surgeon_id"], name: "index_operation_records_on_primary_surgeon_id", using: :btree

  create_table "operation_records_additional_surgeons", id: false, force: :cascade do |t|
    t.integer "operation_record_id"
    t.integer "doctor_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "reg_no"
    t.string   "birth_year"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
