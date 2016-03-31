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

ActiveRecord::Schema.define(version: 20160331170956) do

  create_table "areas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "calls", force: :cascade do |t|
    t.boolean  "incoming"
    t.boolean  "outgoing"
    t.date     "call_date"
    t.time     "call_time"
    t.string   "extension",    limit: 255
    t.string   "dial_number",  limit: 255
    t.integer  "ring",         limit: 4
    t.time     "duration"
    t.string   "cd",           limit: 255
    t.float    "cost",         limit: 24
    t.integer  "clave",        limit: 4
    t.integer  "co",           limit: 4
    t.integer  "proveedor_id", limit: 4
    t.boolean  "cell"
    t.string   "destiny",      limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "acc_code",     limit: 53
  end

  create_table "constants", force: :cascade do |t|
    t.float    "franco_oro",   limit: 24
    t.integer  "proveedor_id", limit: 4
    t.float    "ficha_local",  limit: 24
    t.float    "unidad_aire",  limit: 24
    t.float    "bloque_30",    limit: 24
    t.float    "IVA",          limit: 24
    t.float    "UC",           limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "code",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "coef_n1",    limit: 24
    t.float    "coef_n2",    limit: 24
    t.float    "coef_r1",    limit: 24
    t.float    "coef_r2",    limit: 24
  end

  create_table "ficha_nacionals", force: :cascade do |t|
    t.integer  "code",         limit: 4
    t.float    "valor_seg_n",  limit: 24
    t.integer  "constante_id", limit: 4
    t.float    "valor_seg_r",  limit: 24
    t.float    "valor_min_r",  limit: 24
    t.float    "valor_min_n",  limit: 24
    t.float    "description",  limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "fichans", force: :cascade do |t|
    t.integer  "code",        limit: 4
    t.float    "valor_sec_n", limit: 24
    t.float    "valor_sec_r", limit: 24
    t.float    "valor_min_n", limit: 24
    t.float    "valor_min_r", limit: 24
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "localidads", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "clave_nqn",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "interurbano", limit: 4
  end

  create_table "permissions", force: :cascade do |t|
    t.boolean  "activo"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "proovedors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "proveedors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "area_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.integer  "internal",               limit: 4
    t.string   "password_security",      limit: 255
    t.boolean  "admin"
    t.integer  "area_id",                limit: 4
    t.integer  "sector_id",              limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
