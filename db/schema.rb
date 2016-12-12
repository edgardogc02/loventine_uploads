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

ActiveRecord::Schema.define(version: 20161206142225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.text     "body"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "namespace",     limit: 255
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id", using: :btree
  end

  create_table "activities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_translations", force: :cascade do |t|
    t.integer  "activity_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["activity_id"], name: "index_activity_translations_on_activity_id", using: :btree
    t.index ["locale"], name: "index_activity_translations_on_locale", using: :btree
  end

  create_table "admin_user_photo_logins", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "ip",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_admin_user_photo_logins_on_user_id", using: :btree
  end

  create_table "banned_user_photos", force: :cascade do |t|
    t.string   "image"
    t.string   "source",         limit: 250
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "fingerprint"
    t.integer  "banned_user_id"
  end

  create_table "banned_users", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "username",   limit: 1024,             null: false
    t.string   "email",      limit: 1024,             null: false
    t.integer  "reason",                  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comment"
  end

  create_table "basic_profile_attribute_translations", force: :cascade do |t|
    t.integer  "basic_profile_attribute_id"
    t.string   "locale",                     limit: 255
    t.string   "name",                       limit: 255, null: false
    t.text     "header_introduction"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "display_position",                       null: false
    t.index ["basic_profile_attribute_id"], name: "index_5641e13c432cd490a927df6440feb75e15157642", using: :btree
    t.index ["locale"], name: "index_basic_profile_attribute_translations_on_locale", using: :btree
  end

  create_table "basic_profile_attributes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blacklisted_texts", force: :cascade do |t|
    t.string   "text",       limit: 1024,             null: false
    t.string   "type",       limit: 255,              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category",                default: 0
  end

  create_table "blacklisted_winks", force: :cascade do |t|
    t.string   "sender",     limit: 255
    t.text     "receivers"
    t.string   "text",       limit: 255
    t.text     "comment"
    t.integer  "sender_id"
    t.string   "sender_ip",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "body_type_translations", force: :cascade do |t|
    t.integer  "body_type_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["body_type_id"], name: "index_body_type_translations_on_body_type_id", using: :btree
    t.index ["locale"], name: "index_body_type_translations_on_locale", using: :btree
  end

  create_table "body_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_translations", force: :cascade do |t|
    t.integer  "book_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["book_id"], name: "index_book_translations_on_book_id", using: :btree
    t.index ["locale"], name: "index_book_translations_on_locale", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer  "chat_room_id",              null: false
    t.integer  "sender_id",                 null: false
    t.string   "message",      limit: 1000, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "display_date"
    t.index ["chat_room_id"], name: "index_chat_messages_on_chat_room_id", using: :btree
    t.index ["created_at"], name: "index_chat_messages_on_created_at", using: :btree
    t.index ["sender_id"], name: "index_chat_messages_on_sender_id", using: :btree
  end

  create_table "chat_room_participants", force: :cascade do |t|
    t.integer  "chat_room_id",                            null: false
    t.integer  "user_id",                                 null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "username",     limit: 255,                null: false
    t.boolean  "active",                                  null: false
    t.boolean  "sound",                    default: true
    t.index ["active"], name: "index_chat_room_participants_on_active", using: :btree
    t.index ["chat_room_id"], name: "index_chat_room_participants_on_chat_room_id", using: :btree
    t.index ["user_id"], name: "index_chat_room_participants_on_user_id", using: :btree
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "sessionId",  limit: 255
  end

  create_table "cities", force: :cascade do |t|
    t.integer  "state_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "city_translations", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["city_id"], name: "index_city_translations_on_city_id", using: :btree
    t.index ["locale"], name: "index_city_translations_on_locale", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment",          limit: 150, null: false
    t.string   "locale",           limit: 50,  null: false
    t.integer  "commentable_id"
    t.string   "commentable_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "needs_moderation"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  end

  create_table "contact_us_reason_translations", force: :cascade do |t|
    t.integer  "contact_us_reason_id"
    t.string   "locale",               limit: 255
    t.string   "name",                 limit: 255, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "display_position",                 null: false
    t.boolean  "use_for_feedback"
    t.string   "header_introduction",  limit: 255
    t.index ["contact_us_reason_id"], name: "index_contact_us_reason_translations_on_contact_us_reason_id", using: :btree
    t.index ["locale"], name: "index_contact_us_reason_translations_on_locale", using: :btree
  end

  create_table "contact_us_reasons", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "icon_class", limit: 255
  end

  create_table "countries", force: :cascade do |t|
    t.string   "iso_code",     limit: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "locale",       limit: 255
    t.string   "currency",     limit: 255
    t.string   "currency_iso", limit: 255
    t.boolean  "banned",                   default: false
    t.index ["banned"], name: "index_countries_on_banned", using: :btree
  end

  create_table "country_translations", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["country_id"], name: "index_country_translations_on_country_id", using: :btree
    t.index ["locale"], name: "index_country_translations_on_locale", using: :btree
  end

  create_table "deleted_reasons", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "drinking_habit_translations", force: :cascade do |t|
    t.integer  "drinking_habit_id"
    t.string   "locale",            limit: 255
    t.string   "name",              limit: 255, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "display_position",              null: false
    t.index ["drinking_habit_id"], name: "index_drinking_habit_translations_on_drinking_habit_id", using: :btree
    t.index ["locale"], name: "index_drinking_habit_translations_on_locale", using: :btree
  end

  create_table "drinking_habits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eyes_colour_translations", force: :cascade do |t|
    t.integer  "eyes_colour_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["eyes_colour_id"], name: "index_eyes_colour_translations_on_eyes_colour_id", using: :btree
    t.index ["locale"], name: "index_eyes_colour_translations_on_locale", using: :btree
  end

  create_table "eyes_colours", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gender_translations", force: :cascade do |t|
    t.integer  "gender_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["gender_id"], name: "index_gender_translations_on_gender_id", using: :btree
    t.index ["locale"], name: "index_gender_translations_on_locale", using: :btree
  end

  create_table "genders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hair_colour_translations", force: :cascade do |t|
    t.integer  "hair_colour_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["hair_colour_id"], name: "index_hair_colour_translations_on_hair_colour_id", using: :btree
    t.index ["locale"], name: "index_hair_colour_translations_on_locale", using: :btree
  end

  create_table "hair_colours", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "height_translations", force: :cascade do |t|
    t.integer  "height_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["height_id"], name: "index_height_translations_on_height_id", using: :btree
    t.index ["locale"], name: "index_height_translations_on_locale", using: :btree
  end

  create_table "heights", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invalid_email_domains", force: :cascade do |t|
    t.string   "domain",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invalid_usernames", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ip_geolocalizations", force: :cascade do |t|
    t.string   "ip_start",      limit: 255
    t.string   "ip_end",        limit: 255
    t.bigint   "ip_to_i_start"
    t.bigint   "ip_to_i_end"
    t.integer  "country_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["country_id"], name: "index_ip_geolocalizations_on_country_id", using: :btree
    t.index ["ip_to_i_end"], name: "index_ip_geolocalizations_on_ip_to_i_end", using: :btree
    t.index ["ip_to_i_start"], name: "index_ip_geolocalizations_on_ip_to_i_start", using: :btree
  end

  create_table "kid_translations", force: :cascade do |t|
    t.integer  "kid_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["kid_id"], name: "index_kid_translations_on_kid_id", using: :btree
    t.index ["locale"], name: "index_kid_translations_on_locale", using: :btree
  end

  create_table "kids", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_translations", force: :cascade do |t|
    t.integer  "language_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["language_id"], name: "index_language_translations_on_language_id", using: :btree
    t.index ["locale"], name: "index_language_translations_on_locale", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.boolean  "hide"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "locale",     limit: 10
  end

  create_table "location_tag_translations", force: :cascade do |t|
    t.integer  "location_tag_id"
    t.string   "locale",          limit: 255
    t.string   "tag",             limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["locale"], name: "index_location_tag_translations_on_locale", using: :btree
    t.index ["location_tag_id"], name: "index_location_tag_translations_on_location_tag_id", using: :btree
    t.index ["tag"], name: "index_location_tag_translations_on_tag", using: :btree
  end

  create_table "location_tags", force: :cascade do |t|
    t.integer  "country_id", null: false
    t.integer  "state_id"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_location_tags_on_city_id", using: :btree
    t.index ["country_id"], name: "index_location_tags_on_country_id", using: :btree
    t.index ["state_id"], name: "index_location_tags_on_state_id", using: :btree
  end

  create_table "love_stories", force: :cascade do |t|
    t.string   "username_1", limit: 255, null: false
    t.string   "username_2", limit: 255, null: false
    t.text     "story",                  null: false
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "public"
  end

  create_table "marital_status_translations", force: :cascade do |t|
    t.integer  "marital_status_id"
    t.string   "locale",            limit: 255
    t.string   "name",              limit: 255, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "display_position",              null: false
    t.index ["locale"], name: "index_marital_status_translations_on_locale", using: :btree
    t.index ["marital_status_id"], name: "index_marital_status_translations_on_marital_status_id", using: :btree
  end

  create_table "marital_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_translations", force: :cascade do |t|
    t.integer  "movie_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_movie_translations_on_locale", using: :btree
    t.index ["movie_id"], name: "index_movie_translations_on_movie_id", using: :btree
  end

  create_table "movies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "music_translations", force: :cascade do |t|
    t.integer  "music_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_music_translations_on_locale", using: :btree
    t.index ["music_id"], name: "index_music_translations_on_music_id", using: :btree
  end

  create_table "musics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occupation_translations", force: :cascade do |t|
    t.integer  "occupation_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_occupation_translations_on_locale", using: :btree
    t.index ["occupation_id"], name: "index_occupation_translations_on_occupation_id", using: :btree
  end

  create_table "occupations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_privacies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "other_privacy_translations", force: :cascade do |t|
    t.integer  "other_privacy_id"
    t.string   "locale",              limit: 255
    t.string   "name",                limit: 255, null: false
    t.text     "header_introduction"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "display_position",                null: false
    t.index ["locale"], name: "index_other_privacy_translations_on_locale", using: :btree
    t.index ["other_privacy_id"], name: "index_other_privacy_translations_on_other_privacy_id", using: :btree
  end

  create_table "payment_type_translations", force: :cascade do |t|
    t.integer  "payment_type_id"
    t.string   "locale",          limit: 255
    t.string   "name",            limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["locale"], name: "index_payment_type_translations_on_locale", using: :btree
    t.index ["payment_type_id"], name: "index_payment_type_translations_on_payment_type_id", using: :btree
  end

  create_table "payment_types", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position"
    t.string   "css_class_name",   limit: 255
  end

  create_table "pending_jobs", force: :cascade do |t|
    t.string   "worker_class_name", limit: 255
    t.string   "params",            limit: 255, array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_message_contact_us_reasons", force: :cascade do |t|
    t.integer  "personal_message_id"
    t.integer  "contact_us_reason_id"
    t.string   "contact_email",        limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["contact_us_reason_id"], name: "index_pm_contact_us_reasons_on_contact_us_reason_id", using: :btree
    t.index ["personal_message_id"], name: "index_pm_contact_us_reasons_on_personal_message_id", using: :btree
  end

  create_table "personal_message_default_replies", force: :cascade do |t|
    t.text     "reply"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "title",      limit: 255
    t.string   "locale",     limit: 255
  end

  create_table "personal_messages", force: :cascade do |t|
    t.integer  "parent_personal_message_id"
    t.boolean  "is_abuse_report",                                        null: false
    t.string   "subject",                    limit: 255
    t.text     "body"
    t.string   "sender",                     limit: 255,                 null: false
    t.text     "receivers",                                              null: false
    t.text     "reported_users"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.boolean  "spam",                                   default: false
    t.index ["is_abuse_report"], name: "index_personal_messages_on_is_abuse_report", using: :btree
    t.index ["receivers"], name: "index_personal_messages_on_receivers", using: :btree
    t.index ["sender"], name: "index_personal_messages_on_sender", using: :btree
    t.index ["spam"], name: "index_personal_messages_on_spam", using: :btree
  end

  create_table "personalities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personality_translations", force: :cascade do |t|
    t.integer  "personality_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_personality_translations_on_locale", using: :btree
    t.index ["personality_id"], name: "index_personality_translations_on_personality_id", using: :btree
  end

  create_table "premium_plan_country_prices", force: :cascade do |t|
    t.integer  "premium_plan_id",      null: false
    t.integer  "country_id",           null: false
    t.float    "price",                null: false
    t.float    "monthly_price",        null: false
    t.float    "price_without_saving", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["country_id"], name: "index_premium_plan_country_prices_on_country_id", using: :btree
    t.index ["premium_plan_id"], name: "index_premium_plan_country_prices_on_premium_plan_id", using: :btree
  end

  create_table "premium_plan_translations", force: :cascade do |t|
    t.integer  "premium_plan_id"
    t.string   "locale",          limit: 255
    t.string   "name",            limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "description",     limit: 255
    t.index ["locale"], name: "index_premium_plan_translations_on_locale", using: :btree
    t.index ["premium_plan_id"], name: "index_premium_plan_translations_on_premium_plan_id", using: :btree
  end

  create_table "premium_plans", force: :cascade do |t|
    t.float    "price",                            null: false
    t.float    "monthly_price"
    t.boolean  "popular"
    t.integer  "display_position",                 null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.float    "price_without_saving"
    t.boolean  "savings"
    t.string   "css_class_name",       limit: 255
    t.integer  "duration_in_days"
    t.integer  "duration_in_months"
  end

  create_table "press_release_type_translations", force: :cascade do |t|
    t.integer  "press_release_type_id",             null: false
    t.string   "locale",                limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                  limit: 255, null: false
    t.index ["locale"], name: "index_press_release_type_translations_on_locale", using: :btree
    t.index ["press_release_type_id"], name: "index_press_release_type_translations_on_press_release_type_id", using: :btree
  end

  create_table "press_release_types", force: :cascade do |t|
    t.string   "icon",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "press_releases", force: :cascade do |t|
    t.integer "press_release_type_id"
    t.string  "title",                 limit: 255
    t.string  "link",                  limit: 255
    t.string  "description",           limit: 255
    t.boolean "visible"
    t.string  "image",                 limit: 255
    t.integer "display_position"
    t.index ["press_release_type_id"], name: "index_press_releases_on_press_release_type_id", using: :btree
  end

  create_table "privacies", force: :cascade do |t|
    t.string   "display_option", limit: 50, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "privacy_policies", force: :cascade do |t|
    t.text     "text"
    t.string   "locale",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "privacy_translations", force: :cascade do |t|
    t.integer  "privacy_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_privacy_translations_on_locale", using: :btree
    t.index ["privacy_id"], name: "index_privacy_translations_on_privacy_id", using: :btree
  end

  create_table "relationship_translations", force: :cascade do |t|
    t.integer  "relationship_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.string   "seo_name",         limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_relationship_translations_on_locale", using: :btree
    t.index ["relationship_id"], name: "index_relationship_translations_on_relationship_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "religion_translations", force: :cascade do |t|
    t.integer  "religion_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_religion_translations_on_locale", using: :btree
    t.index ["religion_id"], name: "index_religion_translations_on_religion_id", using: :btree
  end

  create_table "religions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "romantic_characteristic_translations", force: :cascade do |t|
    t.integer  "romantic_characteristic_id"
    t.string   "locale",                     limit: 255
    t.string   "name",                       limit: 255, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "display_position",                       null: false
    t.index ["locale"], name: "index_romantic_characteristic_translations_on_locale", using: :btree
    t.index ["romantic_characteristic_id"], name: "index_6c35ae4bf869115cae475a6146dc526cde85d311", using: :btree
  end

  create_table "romantic_characteristics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.integer  "user_id",                   null: false
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.boolean  "with_photo"
    t.integer  "gender_id"
    t.string   "key",           limit: 255, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "online"
    t.string   "name",          limit: 255
    t.jsonb    "extra_options"
    t.index ["city_id"], name: "index_searches_on_city_id", using: :btree
    t.index ["country_id"], name: "index_searches_on_country_id", using: :btree
    t.index ["gender_id"], name: "index_searches_on_gender_id", using: :btree
    t.index ["key"], name: "index_searches_on_key", using: :btree
    t.index ["state_id"], name: "index_searches_on_state_id", using: :btree
    t.index ["user_id"], name: "index_searches_on_user_id", using: :btree
  end

  create_table "section_attributes", force: :cascade do |t|
    t.integer  "section_id",                 null: false
    t.integer  "basic_profile_attribute_id", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["basic_profile_attribute_id"], name: "index_section_attributes_on_basic_profile_attribute_id", using: :btree
    t.index ["section_id"], name: "index_section_attributes_on_section_id", using: :btree
  end

  create_table "section_comments", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.string   "locale",           limit: 10,  null: false
    t.text     "comment",                      null: false
    t.string   "type",             limit: 150, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "needs_moderation"
    t.index ["id", "type"], name: "index_section_comments_on_id_and_type", using: :btree
    t.index ["needs_moderation"], name: "index_section_comments_on_needs_moderation", using: :btree
    t.index ["user_id"], name: "index_section_comments_on_user_id", using: :btree
  end

  create_table "section_translations", force: :cascade do |t|
    t.integer  "section_id"
    t.string   "locale",              limit: 255
    t.string   "name",                limit: 255, null: false
    t.text     "header_introduction"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "display_position"
    t.index ["locale"], name: "index_section_translations_on_locale", using: :btree
    t.index ["section_id"], name: "index_section_translations_on_section_id", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.integer  "percentage"
    t.integer  "parent_section_id"
    t.string   "rails_controller",                        limit: 255
    t.boolean  "locale_dependant"
    t.boolean  "display_in_profile_percentage_completed",             null: false
    t.boolean  "can_user_set_privacy"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "comment_section_id"
    t.string   "icon",                                    limit: 255
  end

  create_table "sign_translations", force: :cascade do |t|
    t.integer  "sign_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_sign_translations_on_locale", using: :btree
    t.index ["sign_id"], name: "index_sign_translations_on_sign_id", using: :btree
  end

  create_table "signs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "smoking_habit_translations", force: :cascade do |t|
    t.integer  "smoking_habit_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_smoking_habit_translations_on_locale", using: :btree
    t.index ["smoking_habit_id"], name: "index_smoking_habit_translations_on_smoking_habit_id", using: :btree
  end

  create_table "smoking_habits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sport_translations", force: :cascade do |t|
    t.integer  "sport_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_sport_translations_on_locale", using: :btree
    t.index ["sport_id"], name: "index_sport_translations_on_sport_id", using: :btree
  end

  create_table "sports", force: :cascade do |t|
    t.string   "display_option", limit: 50, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "state_translations", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "locale",           limit: 255
    t.string   "name",             limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "display_position",             null: false
    t.index ["locale"], name: "index_state_translations_on_locale", using: :btree
    t.index ["state_id"], name: "index_state_translations_on_state_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.integer  "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
  end

  create_table "success_stories", force: :cascade do |t|
    t.string   "man_name",         limit: 255
    t.string   "woman_name",       limit: 255
    t.integer  "man_city_id"
    t.integer  "man_country_id"
    t.integer  "woman_city_id"
    t.integer  "woman_country_id"
    t.text     "story"
    t.string   "locale",           limit: 255
    t.string   "image",            limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "man_state_id"
    t.integer  "woman_state_id"
    t.integer  "man_age"
    t.integer  "woman_age"
    t.string   "slug",             limit: 255
    t.index ["man_city_id"], name: "index_success_stories_on_man_city_id", using: :btree
    t.index ["man_country_id"], name: "index_success_stories_on_man_country_id", using: :btree
    t.index ["man_state_id"], name: "index_success_stories_on_man_state_id", using: :btree
    t.index ["woman_city_id"], name: "index_success_stories_on_woman_city_id", using: :btree
    t.index ["woman_country_id"], name: "index_success_stories_on_woman_country_id", using: :btree
    t.index ["woman_state_id"], name: "index_success_stories_on_woman_state_id", using: :btree
  end

  create_table "terms_and_conditions", force: :cascade do |t|
    t.text     "text"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "locale",     limit: 255
  end

  create_table "user_about_me_translations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "locale",           limit: 255
    t.text     "about_me"
    t.boolean  "needs_moderation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["needs_moderation"], name: "index_user_about_me_translations_on_needs_moderation", using: :btree
    t.index ["user_id"], name: "index_user_about_me_translations_on_user_id", using: :btree
  end

  create_table "user_activities", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "activity_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_user_activities_on_activity_id", using: :btree
    t.index ["user_id"], name: "index_user_activities_on_user_id", using: :btree
  end

  create_table "user_activity_feed_settings", force: :cascade do |t|
    t.integer  "user_id"
    t.jsonb    "settings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_user_activity_feed_settings_on_user_id", using: :btree
  end

  create_table "user_activity_feeds", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action",              limit: 255
    t.integer  "trackable_id"
    t.string   "trackable_type",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipient_id"
    t.jsonb    "params"
    t.boolean  "viewed_by_recipient",             default: false
    t.index ["action"], name: "index_user_activity_feeds_on_action", using: :btree
    t.index ["created_at"], name: "index_user_activity_feeds_on_created_at", using: :btree
    t.index ["recipient_id"], name: "index_user_activity_feeds_on_recipient_id", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_user_activity_feeds_on_trackable_id_and_trackable_type", using: :btree
    t.index ["trackable_id"], name: "index_user_activity_feeds_on_trackable_id", using: :btree
    t.index ["trackable_type"], name: "index_user_activity_feeds_on_trackable_type", using: :btree
    t.index ["user_id"], name: "index_user_activity_feeds_on_user_id", using: :btree
    t.index ["viewed_by_recipient"], name: "index_user_activity_feeds_on_viewed_by_recipient", using: :btree
  end

  create_table "user_api_keys", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "token",      limit: 255, null: false
    t.string   "api",        limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["token"], name: "index_user_api_keys_on_token", using: :btree
    t.index ["user_id", "api"], name: "index_user_api_keys_on_user_id_and_api", using: :btree
  end

  create_table "user_blocked_users", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.integer  "blocked_user_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["blocked_user_id"], name: "index_user_blocked_users_on_blocked_user_id", using: :btree
    t.index ["user_id"], name: "index_user_blocked_users_on_user_id", using: :btree
  end

  create_table "user_books", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "book_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "user_id"], name: "index_user_books_on_book_id_and_user_id", using: :btree
    t.index ["book_id"], name: "index_user_books_on_book_id", using: :btree
    t.index ["user_id"], name: "index_user_books_on_user_id", using: :btree
  end

  create_table "user_completed_sections", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.integer  "section_id",            null: false
    t.string   "locale",     limit: 50
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["section_id"], name: "index_user_completed_sections_on_section_id", using: :btree
    t.index ["user_id"], name: "index_user_completed_sections_on_user_id", using: :btree
  end

  create_table "user_desired_partner_basics", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "min_height_id"
    t.integer  "max_height_id"
    t.boolean  "with_photo"
    t.integer  "gender_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["city_id"], name: "index_user_desired_partner_basics_on_city_id", using: :btree
    t.index ["country_id"], name: "index_user_desired_partner_basics_on_country_id", using: :btree
    t.index ["gender_id"], name: "index_user_desired_partner_basics_on_gender_id", using: :btree
    t.index ["max_height_id"], name: "index_user_desired_partner_basics_on_max_height_id", using: :btree
    t.index ["min_height_id"], name: "index_user_desired_partner_basics_on_min_height_id", using: :btree
    t.index ["state_id"], name: "index_user_desired_partner_basics_on_state_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_basics_on_user_id", using: :btree
  end

  create_table "user_desired_partner_body_types", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "body_type_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["body_type_id", "user_id"], name: "index_user_dp_bt_on_body_type_id_and_user_id", using: :btree
    t.index ["body_type_id"], name: "index_user_desired_partner_body_types_on_body_type_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_body_types_on_user_id", using: :btree
  end

  create_table "user_desired_partner_drinking_habits", force: :cascade do |t|
    t.integer  "user_id",           null: false
    t.integer  "drinking_habit_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["drinking_habit_id", "user_id"], name: "index_user_dp_dh_on_drinking_habit_id_and_user_id", using: :btree
    t.index ["drinking_habit_id"], name: "index_user_desired_partner_drinking_habits_on_drinking_habit_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_drinking_habits_on_user_id", using: :btree
  end

  create_table "user_desired_partner_eyes_colours", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "eyes_colour_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["eyes_colour_id", "user_id"], name: "index_user_dp_ec_on_eyes_colour_id_and_user_id", using: :btree
    t.index ["eyes_colour_id"], name: "index_user_desired_partner_eyes_colours_on_eyes_colour_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_eyes_colours_on_user_id", using: :btree
  end

  create_table "user_desired_partner_hair_colours", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "hair_colour_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["hair_colour_id", "user_id"], name: "index_user_dp_hc_on_hair_colour_id_and_user_id", using: :btree
    t.index ["hair_colour_id"], name: "index_user_desired_partner_hair_colours_on_hair_colour_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_hair_colours_on_user_id", using: :btree
  end

  create_table "user_desired_partner_kids", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "kid_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kid_id", "user_id"], name: "index_user_desired_partner_kids_on_kid_id_and_user_id", using: :btree
    t.index ["kid_id"], name: "index_user_desired_partner_kids_on_kid_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_kids_on_user_id", using: :btree
  end

  create_table "user_desired_partner_languages", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "language_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["language_id", "user_id"], name: "index_user_desired_partner_languages_on_language_id_and_user_id", using: :btree
    t.index ["language_id"], name: "index_user_desired_partner_languages_on_language_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_languages_on_user_id", using: :btree
  end

  create_table "user_desired_partner_marital_statuses", force: :cascade do |t|
    t.integer  "user_id",           null: false
    t.integer  "marital_status_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["marital_status_id", "user_id"], name: "index_user_dp_ms_on_marital_status_id_and_user_id", using: :btree
    t.index ["marital_status_id"], name: "index_user_dp_ms_on_marital_status_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_marital_statuses_on_user_id", using: :btree
  end

  create_table "user_desired_partner_occupations", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "occupation_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["occupation_id", "user_id"], name: "index_user_dp_oc_on_occupation_id_and_user_id", using: :btree
    t.index ["occupation_id"], name: "index_user_desired_partner_occupations_on_occupation_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_occupations_on_user_id", using: :btree
  end

  create_table "user_desired_partner_religions", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "religion_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["religion_id", "user_id"], name: "index_user_dp_re_on_religion_id_and_user_id", using: :btree
    t.index ["religion_id"], name: "index_user_desired_partner_religions_on_religion_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_religions_on_user_id", using: :btree
  end

  create_table "user_desired_partner_signs", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "sign_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sign_id", "user_id"], name: "index_user_desired_partner_signs_on_sign_id_and_user_id", using: :btree
    t.index ["sign_id"], name: "index_user_desired_partner_signs_on_sign_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_signs_on_user_id", using: :btree
  end

  create_table "user_desired_partner_smoking_habits", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.integer  "smoking_habit_id", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["smoking_habit_id", "user_id"], name: "index_user_dp_sh_on_smoking_habit_id_and_user_id", using: :btree
    t.index ["smoking_habit_id"], name: "index_user_desired_partner_smoking_habits_on_smoking_habit_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_smoking_habits_on_user_id", using: :btree
  end

  create_table "user_desired_partner_sports", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "sport_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id", "user_id"], name: "index_user_desired_partner_sports_on_sport_id_and_user_id", using: :btree
    t.index ["sport_id"], name: "index_user_desired_partner_sports_on_sport_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partner_sports_on_user_id", using: :btree
  end

  create_table "user_desired_partners", force: :cascade do |t|
    t.integer  "user_id",                 null: false
    t.integer  "user_desired_partner_id", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["user_desired_partner_id"], name: "index_user_desired_partners_on_user_desired_partner_id", using: :btree
    t.index ["user_id"], name: "index_user_desired_partners_on_user_id", using: :btree
  end

  create_table "user_facebook_credentials", force: :cascade do |t|
    t.integer  "user_id",                                  null: false
    t.string   "f_uid",                        limit: 255, null: false
    t.string   "username",                     limit: 255
    t.string   "first_name",                   limit: 255
    t.string   "last_name",                    limit: 255
    t.string   "sign_in_oauth_token",          limit: 255
    t.datetime "sign_in_oauth_expires_at"
    t.string   "user_photos_auth_token",       limit: 255
    t.datetime "user_photos_oauth_expires_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "name",                         limit: 255
    t.string   "email",                        limit: 255
    t.string   "user_likes_auth_token",        limit: 255
    t.datetime "user_likes_oauth_expires_at"
    t.index ["email"], name: "index_user_facebook_credentials_on_email", using: :btree
    t.index ["f_uid"], name: "index_user_facebook_credentials_on_f_uid", using: :btree
    t.index ["user_id"], name: "index_user_facebook_credentials_on_user_id", using: :btree
  end

  create_table "user_facebook_invitations", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.string   "facebook_user_id", limit: 255, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["user_id"], name: "index_user_facebook_invitations_on_user_id", using: :btree
  end

  create_table "user_favourite_users", force: :cascade do |t|
    t.integer  "user_id",           null: false
    t.integer  "favourite_user_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["favourite_user_id"], name: "index_user_favourite_users_on_favourite_user_id", using: :btree
    t.index ["user_id"], name: "index_user_favourite_users_on_user_id", using: :btree
  end

  create_table "user_introduction_translations", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.string   "locale",           limit: 10, null: false
    t.string   "personal_message", limit: 50, null: false
    t.text     "introduction"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "needs_moderation"
    t.index ["needs_moderation"], name: "index_user_introduction_translations_on_needs_moderation", using: :btree
    t.index ["user_id"], name: "index_user_introduction_translations_on_user_id", using: :btree
  end

  create_table "user_invitations", force: :cascade do |t|
    t.integer  "user_id",                  null: false
    t.string   "friend_email", limit: 255, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "provider",     limit: 255, null: false
    t.index ["user_id"], name: "index_user_invitations_on_user_id", using: :btree
  end

  create_table "user_languages", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "language_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id", using: :btree
    t.index ["user_id"], name: "index_user_languages_on_user_id", using: :btree
  end

  create_table "user_liked_profile_preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "min_age"
    t.integer  "max_age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_user_liked_profile_preferences_on_user_id", using: :btree
  end

  create_table "user_liked_profile_views", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "viewed_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_user_liked_profile_views_on_user_id", using: :btree
    t.index ["viewed_user_id"], name: "index_user_liked_profile_views_on_viewed_user_id", using: :btree
  end

  create_table "user_liked_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "liked_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["liked_user_id"], name: "index_user_liked_profiles_on_liked_user_id", using: :btree
    t.index ["user_id"], name: "index_user_liked_profiles_on_user_id", using: :btree
  end

  create_table "user_list_users", force: :cascade do |t|
    t.integer  "user_list_id", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_user_list_users_on_user_id", using: :btree
    t.index ["user_list_id"], name: "index_user_list_users_on_user_list_id", using: :btree
  end

  create_table "user_lists", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_user_lists_on_user_id", using: :btree
  end

  create_table "user_logins", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.date     "login_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login_date"], name: "index_user_logins_on_login_date", using: :btree
    t.index ["user_id"], name: "index_user_logins_on_user_id", using: :btree
  end

  create_table "user_movies", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "movie_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id", "user_id"], name: "index_user_movies_on_movie_id_and_user_id", using: :btree
    t.index ["movie_id"], name: "index_user_movies_on_movie_id", using: :btree
    t.index ["user_id"], name: "index_user_movies_on_user_id", using: :btree
  end

  create_table "user_musics", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "music_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id", "user_id"], name: "index_user_musics_on_music_id_and_user_id", using: :btree
    t.index ["music_id"], name: "index_user_musics_on_music_id", using: :btree
    t.index ["user_id"], name: "index_user_musics_on_user_id", using: :btree
  end

  create_table "user_omniauth_credentials", force: :cascade do |t|
    t.integer  "user_id",                       null: false
    t.string   "provider",         limit: 255,  null: false
    t.string   "oauth_uid",        limit: 255,  null: false
    t.string   "username",         limit: 255
    t.string   "first_name",       limit: 255
    t.string   "last_name",        limit: 255
    t.string   "email",            limit: 255
    t.string   "oauth_token",      limit: 2000
    t.datetime "oauth_expires_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["email"], name: "index_user_omniauth_credentials_on_email", using: :btree
    t.index ["provider"], name: "index_user_omniauth_credentials_on_provider", using: :btree
    t.index ["user_id"], name: "index_user_omniauth_credentials_on_user_id", using: :btree
  end

  create_table "user_other_privacies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "other_privacy_id"
    t.integer  "privacy_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["other_privacy_id"], name: "index_user_other_privacies_on_other_privacy_id", using: :btree
    t.index ["privacy_id"], name: "index_user_other_privacies_on_privacy_id", using: :btree
    t.index ["user_id"], name: "index_user_other_privacies_on_user_id", using: :btree
  end

  create_table "user_other_privacy_customizations", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.integer  "other_privacy_id", null: false
    t.integer  "gender_id"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.boolean  "with_photo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["city_id"], name: "index_user_other_privacy_customizations_on_city_id", using: :btree
    t.index ["country_id"], name: "index_user_other_privacy_customizations_on_country_id", using: :btree
    t.index ["gender_id"], name: "index_user_other_privacy_customizations_on_gender_id", using: :btree
    t.index ["other_privacy_id"], name: "index_user_other_privacy_customizations_on_other_privacy_id", using: :btree
    t.index ["state_id"], name: "index_user_other_privacy_customizations_on_state_id", using: :btree
    t.index ["user_id"], name: "index_user_other_privacy_customizations_on_user_id", using: :btree
  end

  create_table "user_other_privacy_user_lists", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.integer  "other_privacy_id", null: false
    t.integer  "user_list_id",     null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["other_privacy_id"], name: "index_user_other_privacy_user_lists_on_other_privacy_id", using: :btree
    t.index ["user_id"], name: "index_user_other_privacy_user_lists_on_user_id", using: :btree
    t.index ["user_list_id"], name: "index_user_other_privacy_user_lists_on_user_list_id", using: :btree
  end

  create_table "user_personalities", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "personality_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["personality_id"], name: "index_user_personalities_on_personality_id", using: :btree
    t.index ["user_id"], name: "index_user_personalities_on_user_id", using: :btree
  end

  create_table "user_photo_rejected_reason_translations", force: :cascade do |t|
    t.integer  "user_photo_rejected_reason_id",             null: false
    t.string   "locale",                        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key",                           limit: 255, null: false
    t.text     "reason",                                    null: false
    t.index ["locale"], name: "index_user_photo_rejected_reason_translations_on_locale", using: :btree
    t.index ["user_photo_rejected_reason_id"], name: "index_78bf552bd1aaf0cbca9107cd1088105690184753", using: :btree
  end

  create_table "user_photo_rejected_reasons", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_photos", force: :cascade do |t|
    t.integer  "user_id",                                                   null: false
    t.integer  "state",                                                     null: false
    t.boolean  "is_avatar",                                 default: false, null: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "image",                         limit: 255
    t.string   "token",                         limit: 255
    t.string   "image_bck",                     limit: 255
    t.string   "host",                          limit: 255
    t.integer  "user_photo_rejected_reason_id"
    t.string   "image_cloudinary"
    t.integer  "x"
    t.integer  "y"
    t.integer  "w"
    t.integer  "h"
    t.float    "scale"
    t.integer  "angle"
    t.string   "fingerprint"
    t.index ["fingerprint"], name: "index_user_photos_on_fingerprint", using: :btree
    t.index ["is_avatar"], name: "index_user_photos_on_is_avatar", using: :btree
    t.index ["state"], name: "index_user_photos_on_state", using: :btree
    t.index ["token"], name: "index_user_photos_on_token", using: :btree
    t.index ["user_id"], name: "index_user_photos_on_user_id", using: :btree
  end

  create_table "user_premium_subscriptions", force: :cascade do |t|
    t.integer  "user_id",                     null: false
    t.integer  "payment_type_id"
    t.integer  "premium_plan_id",             null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "token",           limit: 255
    t.string   "stripe_token",    limit: 255
    t.string   "currency_iso",    limit: 255
    t.float    "price"
    t.string   "paypal_token",    limit: 255
    t.boolean  "confirmed"
    t.index ["confirmed"], name: "index_user_premium_subscriptions_on_confirmed", using: :btree
    t.index ["payment_type_id"], name: "index_user_premium_subscriptions_on_payment_type_id", using: :btree
    t.index ["premium_plan_id"], name: "index_user_premium_subscriptions_on_premium_plan_id", using: :btree
    t.index ["user_id"], name: "index_user_premium_subscriptions_on_user_id", using: :btree
  end

  create_table "user_profile_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "liked_user_id"
    t.boolean  "viewed",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "match",         default: false
    t.boolean  "match_viewed",  default: false
    t.index ["liked_user_id"], name: "index_user_profile_likes_on_liked_user_id", using: :btree
    t.index ["match"], name: "index_user_profile_likes_on_match", using: :btree
    t.index ["match_viewed"], name: "index_user_profile_likes_on_match_viewed", using: :btree
    t.index ["user_id"], name: "index_user_profile_likes_on_user_id", using: :btree
    t.index ["viewed"], name: "index_user_profile_likes_on_viewed", using: :btree
  end

  create_table "user_profile_views", force: :cascade do |t|
    t.integer  "viewed_user_id",                 null: false
    t.integer  "viewer_user_id",                 null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "viewed",         default: false
    t.index ["viewed_user_id"], name: "index_user_profile_views_on_viewed_user_id", using: :btree
    t.index ["viewer_user_id"], name: "index_user_profile_views_on_viewer_user_id", using: :btree
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "gender_id",                     null: false
    t.integer  "kid_id"
    t.integer  "smoking_habit_id"
    t.integer  "drinking_habit_id"
    t.integer  "religion_id"
    t.integer  "sign_id"
    t.integer  "body_type_id"
    t.integer  "eyes_colour_id"
    t.integer  "hair_colour_id"
    t.integer  "marital_status_id"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "user_id"
    t.date     "birthday",                      null: false
    t.integer  "height_id"
    t.integer  "occupation_id"
    t.string   "name",              limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["birthday"], name: "index_user_profiles_on_birthday", using: :btree
    t.index ["body_type_id"], name: "index_user_profiles_on_body_type_id", using: :btree
    t.index ["city_id"], name: "index_user_profiles_on_city_id", using: :btree
    t.index ["country_id"], name: "index_user_profiles_on_country_id", using: :btree
    t.index ["drinking_habit_id"], name: "index_user_profiles_on_drinking_habit_id", using: :btree
    t.index ["eyes_colour_id"], name: "index_user_profiles_on_eyes_colour_id", using: :btree
    t.index ["gender_id"], name: "index_user_profiles_on_gender_id", using: :btree
    t.index ["hair_colour_id"], name: "index_user_profiles_on_hair_colour_id", using: :btree
    t.index ["height_id"], name: "index_user_profiles_on_height_id", using: :btree
    t.index ["kid_id"], name: "index_user_profiles_on_kid_id", using: :btree
    t.index ["marital_status_id"], name: "index_user_profiles_on_marital_status_id", using: :btree
    t.index ["occupation_id"], name: "index_user_profiles_on_occupation_id", using: :btree
    t.index ["religion_id"], name: "index_user_profiles_on_religion_id", using: :btree
    t.index ["sign_id"], name: "index_user_profiles_on_sign_id", using: :btree
    t.index ["smoking_habit_id"], name: "index_user_profiles_on_smoking_habit_id", using: :btree
    t.index ["state_id"], name: "index_user_profiles_on_state_id", using: :btree
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "user_proposed_date_interested_users", force: :cascade do |t|
    t.integer  "user_proposed_date_id", null: false
    t.integer  "user_id",               null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_user_pdiu_on_user_id", using: :btree
    t.index ["user_proposed_date_id"], name: "index_user_pdiu_on_user_proposed_date_id", using: :btree
  end

  create_table "user_proposed_dates", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "date_type",   null: false
    t.date     "date_date"
    t.integer  "country_id",  null: false
    t.integer  "state_id",    null: false
    t.integer  "city_id",     null: false
    t.text     "description", null: false
    t.integer  "date_state",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["city_id"], name: "index_user_proposed_dates_on_city_id", using: :btree
    t.index ["country_id"], name: "index_user_proposed_dates_on_country_id", using: :btree
    t.index ["state_id"], name: "index_user_proposed_dates_on_state_id", using: :btree
    t.index ["user_id"], name: "index_user_proposed_dates_on_user_id", using: :btree
  end

  create_table "user_received_personal_messages", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "personal_message_id",    null: false
    t.integer  "personal_message_state", null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["created_at"], name: "index_user_received_personal_messages_on_created_at", using: :btree
    t.index ["personal_message_id", "user_id"], name: "index_user_rpm_on_personal_message_id_and_user_id", using: :btree
    t.index ["personal_message_id"], name: "index_user_received_personal_messages_on_personal_message_id", using: :btree
    t.index ["personal_message_state"], name: "index_user_received_personal_messages_on_personal_message_state", using: :btree
    t.index ["user_id"], name: "index_user_received_personal_messages_on_user_id", using: :btree
  end

  create_table "user_received_winks", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.integer  "wink_output_id",        null: false
    t.integer  "wink_state",            null: false
    t.integer  "wink_response_text_id", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id", "wink_output_id"], name: "index_user_received_winks_on_user_id_and_wink_output_id", using: :btree
    t.index ["user_id"], name: "index_user_received_winks_on_user_id", using: :btree
    t.index ["wink_output_id"], name: "index_user_received_winks_on_wink_output_id", using: :btree
    t.index ["wink_response_text_id"], name: "index_user_received_winks_on_wink_response_text_id", using: :btree
    t.index ["wink_state"], name: "index_user_received_winks_on_wink_state", using: :btree
  end

  create_table "user_relationships", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.integer  "relationship_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["relationship_id"], name: "index_user_relationships_on_relationship_id", using: :btree
    t.index ["user_id"], name: "index_user_relationships_on_user_id", using: :btree
  end

  create_table "user_romantic_characteristics", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "romantic_characteristic_id", null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["romantic_characteristic_id"], name: "index_user_rc_on_romantic_characteristic_id", using: :btree
    t.index ["user_id"], name: "index_user_romantic_characteristics_on_user_id", using: :btree
  end

  create_table "user_section_attribute_privacies", force: :cascade do |t|
    t.integer  "user_id",              null: false
    t.integer  "section_attribute_id", null: false
    t.integer  "privacy_id",           null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["privacy_id"], name: "index_user_section_attribute_privacies_on_privacy_id", using: :btree
    t.index ["section_attribute_id"], name: "index_user_section_attribute_privacies_on_section_attribute_id", using: :btree
    t.index ["user_id"], name: "index_user_section_attribute_privacies_on_user_id", using: :btree
  end

  create_table "user_section_attribute_privacy_customizations", force: :cascade do |t|
    t.integer  "user_id",              null: false
    t.integer  "section_attribute_id", null: false
    t.integer  "gender_id"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.boolean  "with_photo"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["city_id"], name: "index_user_sapc_on_city_id", using: :btree
    t.index ["country_id"], name: "index_user_sapc_on_country_id", using: :btree
    t.index ["gender_id"], name: "index_user_sapc_on_gender_id", using: :btree
    t.index ["section_attribute_id"], name: "index_user_sapc_on_section_attribute_id", using: :btree
    t.index ["state_id"], name: "index_user_sapc_on_state_id", using: :btree
    t.index ["user_id"], name: "index_user_sapc_on_user_id", using: :btree
  end

  create_table "user_section_attribute_privacy_user_lists", force: :cascade do |t|
    t.integer  "user_id",              null: false
    t.integer  "section_attribute_id", null: false
    t.integer  "user_list_id",         null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["section_attribute_id"], name: "index_user_sa_pul_on_section_attribute_id", using: :btree
    t.index ["user_id"], name: "index_user_section_attribute_privacy_user_lists_on_user_id", using: :btree
    t.index ["user_list_id"], name: "index_user_section_attribute_privacy_user_lists_on_user_list_id", using: :btree
  end

  create_table "user_section_privacies", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "section_id", null: false
    t.integer  "privacy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["privacy_id"], name: "index_user_section_privacies_on_privacy_id", using: :btree
    t.index ["section_id"], name: "index_user_section_privacies_on_section_id", using: :btree
    t.index ["user_id"], name: "index_user_section_privacies_on_user_id", using: :btree
  end

  create_table "user_section_privacy_customizations", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "section_id", null: false
    t.integer  "gender_id"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.boolean  "with_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_user_section_privacy_customizations_on_city_id", using: :btree
    t.index ["country_id"], name: "index_user_section_privacy_customizations_on_country_id", using: :btree
    t.index ["gender_id"], name: "index_user_section_privacy_customizations_on_gender_id", using: :btree
    t.index ["section_id"], name: "index_user_section_privacy_customizations_on_section_id", using: :btree
    t.index ["state_id"], name: "index_user_section_privacy_customizations_on_state_id", using: :btree
    t.index ["user_id"], name: "index_user_section_privacy_customizations_on_user_id", using: :btree
  end

  create_table "user_section_privacy_user_lists", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "section_id",   null: false
    t.integer  "user_list_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["section_id"], name: "index_user_section_privacy_user_lists_on_section_id", using: :btree
    t.index ["user_id"], name: "index_user_section_privacy_user_lists_on_user_id", using: :btree
    t.index ["user_list_id"], name: "index_user_section_privacy_user_lists_on_user_list_id", using: :btree
  end

  create_table "user_section_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "section",           limit: 255
    t.integer  "requested_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["requested_user_id"], name: "index_user_section_requests_on_requested_user_id", using: :btree
    t.index ["section"], name: "index_user_section_requests_on_section", using: :btree
    t.index ["user_id"], name: "index_user_section_requests_on_user_id", using: :btree
  end

  create_table "user_send_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "friend_name",  limit: 255, null: false
    t.string   "friend_email", limit: 255, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "sender_name",  limit: 255, null: false
    t.string   "sent_profile", limit: 255, null: false
  end

  create_table "user_sent_personal_messages", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "personal_message_id",    null: false
    t.integer  "personal_message_state", null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["created_at"], name: "index_user_sent_personal_messages_on_created_at", using: :btree
    t.index ["personal_message_id"], name: "index_user_sent_personal_messages_on_personal_message_id", using: :btree
    t.index ["personal_message_state"], name: "index_user_sent_personal_messages_on_personal_message_state", using: :btree
    t.index ["user_id"], name: "index_user_sent_personal_messages_on_user_id", using: :btree
  end

  create_table "user_sent_winks", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "wink_output_id", null: false
    t.integer  "wink_state",     null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_user_sent_winks_on_user_id", using: :btree
    t.index ["wink_output_id"], name: "index_user_sent_winks_on_wink_output_id", using: :btree
    t.index ["wink_state"], name: "index_user_sent_winks_on_wink_state", using: :btree
  end

  create_table "user_sports", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "sport_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_user_sports_on_sport_id", using: :btree
    t.index ["user_id"], name: "index_user_sports_on_user_id", using: :btree
  end

  create_table "user_viewed_profiles", force: :cascade do |t|
    t.integer  "user_id",        null: false
    t.integer  "viewed_user_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_user_viewed_profiles_on_user_id", using: :btree
    t.index ["viewed_user_id"], name: "index_user_viewed_profiles_on_viewed_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                     limit: 255,                  null: false
    t.string   "password",                     limit: 255,                  null: false
    t.string   "email",                        limit: 255,                  null: false
    t.integer  "role_id",                                                   null: false
    t.datetime "last_activity"
    t.integer  "search_position",                                           null: false
    t.boolean  "confirmed_email",                                           null: false
    t.boolean  "loggedin",                                                  null: false
    t.boolean  "disabled",                                                  null: false
    t.boolean  "deleted",                                                   null: false
    t.string   "ip",                           limit: 25
    t.string   "browser",                      limit: 255
    t.string   "referer",                      limit: 1000
    t.datetime "mark_deleted_at"
    t.string   "updated_by",                   limit: 255
    t.string   "created_by",                   limit: 255,                  null: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "auth_token",                   limit: 255
    t.string   "password_reset_token",         limit: 255
    t.datetime "password_reset_sent_at"
    t.boolean  "spammer"
    t.boolean  "allow_google_index"
    t.boolean  "premium"
    t.boolean  "display_publicity"
    t.boolean  "receive_email_notifications"
    t.datetime "premium_until"
    t.string   "locale",                       limit: 255
    t.integer  "profile_completeness_percent"
    t.boolean  "visible",                                   default: true
    t.boolean  "display_tour",                              default: true
    t.integer  "age"
    t.boolean  "banned",                                    default: false
    t.boolean  "accepted_messaging_rules",                  default: false
    t.index ["age", "search_position", "last_activity", "id", "username", "role_id", "created_at", "updated_at", "loggedin"], name: "index_users_on_age_s_pos_las_act_id_uname_r_id_cr_at_upd_at_log", using: :btree
    t.index ["auth_token"], name: "index_users_on_auth_token", using: :btree
    t.index ["banned"], name: "index_users_on_banned", using: :btree
    t.index ["created_at", "search_position", "last_activity", "id", "username", "role_id", "updated_at", "age", "loggedin"], name: "index_users_on_cr_at_s_pos_las_act_id_uname_r_id_upd_at_age_log", using: :btree
    t.index ["created_at"], name: "index_users_on_created_at", using: :btree
    t.index ["deleted"], name: "index_users_on_deleted", using: :btree
    t.index ["disabled"], name: "index_users_on_disabled", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["id", "last_activity", "search_position"], name: "index_users_on_id_and_last_activity_and_search_position", using: :btree
    t.index ["last_activity", "deleted"], name: "index_users_on_last_activity_and_deleted", using: :btree
    t.index ["last_activity", "search_position", "id", "username", "role_id", "created_at", "updated_at", "age", "loggedin"], name: "index_users_on_las_act_s_pos_id_uname_r_id_cr_at_upd_at_age_log", using: :btree
    t.index ["last_activity"], name: "index_users_on_last_activity", using: :btree
    t.index ["loggedin"], name: "index_users_on_loggedin", using: :btree
    t.index ["password_reset_token"], name: "index_users_on_password_reset_token", using: :btree
    t.index ["premium", "search_position", "last_activity", "id", "role_id", "username", "updated_at"], name: "index_users_on_prem_pos_last_act_id_rol_id_uname_up_at", using: :btree
    t.index ["premium"], name: "index_users_on_premium", using: :btree
    t.index ["referer", "created_at"], name: "index_users_on_referer_and_created_at", using: :btree
    t.index ["referer"], name: "index_users_on_referer", using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
    t.index ["search_position", "last_activity", "id", "username", "role_id", "created_at", "updated_at", "age", "loggedin"], name: "index_users_on_s_pos_las_act_id_uname_r_id_cr_at_upd_at_age_log", using: :btree
    t.index ["search_position"], name: "index_users_on_search_position", using: :btree
    t.index ["spammer"], name: "index_users_on_spammer", using: :btree
    t.index ["username", "search_position", "last_activity", "id", "role_id", "created_at", "updated_at", "age", "loggedin"], name: "index_users_on_uname_s_pos_las_act_id_r_id_cr_at_upd_at_age_log", using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
    t.index ["visible"], name: "index_users_on_visible", using: :btree
  end

  create_table "view_type_translations", force: :cascade do |t|
    t.integer  "view_type_id"
    t.string   "locale",       limit: 255
    t.string   "name",         limit: 255, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["locale"], name: "index_view_type_translations_on_locale", using: :btree
    t.index ["view_type_id"], name: "index_view_type_translations_on_view_type_id", using: :btree
  end

  create_table "view_types", force: :cascade do |t|
    t.string   "icon",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "wink_outputs", force: :cascade do |t|
    t.integer  "wink_id",                null: false
    t.string   "text",       limit: 255
    t.string   "sender",     limit: 255, null: false
    t.text     "receivers",              null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["wink_id"], name: "index_wink_outputs_on_wink_id", using: :btree
  end

  create_table "wink_response_text_translations", force: :cascade do |t|
    t.integer  "wink_response_text_id"
    t.string   "locale",                limit: 255
    t.string   "name",                  limit: 255, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["locale"], name: "index_wink_response_text_translations_on_locale", using: :btree
    t.index ["wink_response_text_id"], name: "index_wink_response_text_translations_on_wink_response_text_id", using: :btree
  end

  create_table "wink_response_texts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "winks", force: :cascade do |t|
    t.string   "path",       limit: 255, null: false
    t.string   "filename",   limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
