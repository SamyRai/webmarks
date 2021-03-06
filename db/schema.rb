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

ActiveRecord::Schema.define(version: 20_170_313_010_658) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookmarks', force: :cascade do |t|
    t.string   'title',      null: false
    t.string   'url',        null: false
    t.string   'shortening'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer  'user_id'
    t.integer  'site_id'
    t.index ['site_id'], name: 'index_bookmarks_on_site_id', using: :btree
    t.index ['user_id'], name: 'index_bookmarks_on_user_id', using: :btree
  end

  create_table 'bookmarks_tags', id: false, force: :cascade do |t|
    t.integer 'bookmark_id', null: false
    t.integer 'tag_id',      null: false
    t.index %w(bookmark_id tag_id), name: 'index_bookmarks_tags_on_bookmark_id_and_tag_id', using: :btree
  end

  create_table 'sites', force: :cascade do |t|
    t.string   'top_url',    null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tags', force: :cascade do |t|
    t.string   'name',       null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string   'email',      null: false
    t.string   'password',   null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'bookmarks', 'sites'
  add_foreign_key 'bookmarks', 'users'
end
