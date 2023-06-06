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

ActiveRecord::Schema[7.0].define(version: 2023_06_04_152024) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'citext'
  enable_extension 'plpgsql'

  create_table 'account_login_change_keys', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'login', null: false
    t.datetime 'deadline', null: false
  end

  create_table 'account_password_reset_keys', force: :cascade do |t|
    t.string 'key', null: false
    t.datetime 'deadline', null: false
    t.datetime 'email_last_sent', default: -> { 'CURRENT_TIMESTAMP' }, null: false
  end

  create_table 'account_remember_keys', force: :cascade do |t|
    t.string 'key', null: false
    t.datetime 'deadline', null: false
  end

  create_table 'account_verification_keys', force: :cascade do |t|
    t.string 'key', null: false
    t.datetime 'requested_at', default: -> { 'CURRENT_TIMESTAMP' }, null: false
    t.datetime 'email_last_sent', default: -> { 'CURRENT_TIMESTAMP' }, null: false
  end

  create_table 'accounts', force: :cascade do |t|
    t.integer 'status', default: 1, null: false
    t.citext 'email', null: false
    t.string 'password_hash'
    t.index ['email'], name: 'index_accounts_on_email', unique: true, where: '(status = ANY (ARRAY[1, 2]))'
  end

  create_table 'audits', force: :cascade do |t|
    t.integer 'auditable_id'
    t.string 'auditable_type'
    t.integer 'associated_id'
    t.string 'associated_type'
    t.integer 'user_id'
    t.string 'user_type'
    t.string 'username'
    t.string 'action'
    t.text 'audited_changes'
    t.integer 'version', default: 0
    t.string 'comment'
    t.string 'remote_address'
    t.string 'request_uuid'
    t.datetime 'created_at'
    t.index ['associated_type', 'associated_id'], name: 'associated_index'
    t.index ['auditable_type', 'auditable_id', 'version'], name: 'auditable_index'
    t.index ['created_at'], name: 'index_audits_on_created_at'
    t.index ['request_uuid'], name: 'index_audits_on_request_uuid'
    t.index ['user_id', 'user_type'], name: 'user_index'
  end

  create_table 'contents', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'gutentag_taggings', force: :cascade do |t|
    t.integer 'tag_id', null: false
    t.integer 'taggable_id', null: false
    t.string 'taggable_type', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['tag_id'], name: 'index_gutentag_taggings_on_tag_id'
    t.index ['taggable_type', 'taggable_id', 'tag_id'], name: 'unique_taggings', unique: true
    t.index ['taggable_type', 'taggable_id'], name: 'index_gutentag_taggings_on_taggable_type_and_taggable_id'
  end

  create_table 'gutentag_tags', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'taggings_count', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['name'], name: 'index_gutentag_tags_on_name', unique: true
    t.index ['taggings_count'], name: 'index_gutentag_tags_on_taggings_count'
  end

  add_foreign_key 'account_login_change_keys', 'accounts', column: 'id'
  add_foreign_key 'account_password_reset_keys', 'accounts', column: 'id'
  add_foreign_key 'account_remember_keys', 'accounts', column: 'id'
  add_foreign_key 'account_verification_keys', 'accounts', column: 'id'
end
