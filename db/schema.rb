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

ActiveRecord::Schema.define(version: 20160712235855) do

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true

  create_table "cadastro_es", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "telefone"
    t.string   "cpf"
    t.string   "matricula"
    t.integer  "periodo"
    t.string   "curso"
    t.string   "evento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cadastro_es_eventos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidatos", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "cpf"
    t.string   "matricula"
    t.integer  "periodo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "curso_id"
    t.integer  "data_dinamica_id"
    t.string   "edit_digest"
  end

  add_index "candidatos", ["matricula"], name: "index_candidatos_on_matricula", unique: true

  create_table "cursos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_dinamicas", force: :cascade do |t|
    t.string   "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
