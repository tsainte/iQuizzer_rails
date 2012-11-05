class Quiz < ActiveRecord::Base
  attr_accessible :titulo, :perguntas_attributes
  
  has_and_belongs_to_many :usuarios
  has_many :perguntas
  
  accepts_nested_attributes_for :perguntas, allow_destroy: true
end
