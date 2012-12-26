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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121225221046) do

  create_table "dispositivos", :force => true do |t|
    t.string   "modelo"
    t.string   "versao_app"
    t.string   "device_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "usuario_id"
  end

  create_table "jogos", :force => true do |t|
    t.string   "dia"
    t.string   "hora"
    t.float    "pontos"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "usuario_id"
  end

  create_table "perguntas", :force => true do |t|
    t.string   "conteudo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "quiz_id"
  end

  create_table "quizzes", :force => true do |t|
    t.string   "titulo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "usuario_id"
    t.integer  "modojogo"
    t.integer  "maxquestoes"
    t.text     "descricao"
  end

  create_table "quizzes_usuarios", :id => false, :force => true do |t|
    t.integer "quiz_id"
    t.integer "usuario_id"
  end

  create_table "respostas", :force => true do |t|
    t.string   "conteudo"
    t.boolean  "correta"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "pergunta_id"
  end

  create_table "resultados", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "resposta_id"
    t.integer  "jogo_id"
    t.string   "pergunta_conteudo"
    t.string   "resposta_conteudo"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.text     "username"
    t.integer  "scoreplayer"
    t.integer  "scorecreator"
    t.text     "firstname"
    t.text     "lastname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "apelido"
    t.float    "pontos_criador"
    t.float    "pontos_jogador"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "senha"
  end

end
