class Quiz < ActiveRecord::Base
  #modojogo: 1- random, 2- ordenate
  attr_accessible :titulo, :perguntas_attributes, :modojogo, :maxquestoes, :descricao, :usuario_id
  
  #has_and_belongs_to_many :usuarios
  belongs_to :user
  
  has_many :perguntas
  
  accepts_nested_attributes_for :perguntas, allow_destroy: true, update_only: true
end
