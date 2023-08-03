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

ActiveRecord::Schema[7.0].define(version: 2023_08_03_094201) do
  create_table "employeelist", primary_key: "eid", id: { type: :integer, unsigned: true }, charset: "utf8mb3", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "firstName", limit: 31, default: "", null: false
    t.string "lastName", limit: 31, default: "", null: false
    t.string "Email_id", limit: 31, default: "", null: false
    t.string "Email2", limit: 31
    t.string "Email3", limit: 31
    t.string "EMail4", limit: 31
    t.string "folder", limit: 31, default: "", null: false
    t.string "status", limit: 50
    t.index ["Email_id"], name: "Email_id", unique: true
  end

  create_table "messages", primary_key: "mid", id: :integer, default: 0, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "sender", limit: 127, default: "", null: false
    t.datetime "date", precision: nil
    t.string "message_id", limit: 127
    t.text "subject"
    t.text "body"
    t.string "folder", limit: 127, default: "", null: false
    t.index ["sender"], name: "sender"
  end

  create_table "recipientinfos", primary_key: "rid", id: :integer, default: 0, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "mid", default: 0, null: false, unsigned: true
    t.column "rtype", "enum('TO','CC','BCC')"
    t.string "rvalue", limit: 127
    t.datetime "dater", precision: nil
    t.index ["mid"], name: "index_recipientinfos_on_mid"
    t.index ["rvalue"], name: "rvalue"
  end

  create_table "referenceinfo", primary_key: "rfid", id: :integer, default: 0, charset: "utf8mb3", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "mid", default: 0, null: false
    t.text "reference"
  end

end
