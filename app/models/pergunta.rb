class Pergunta < ActiveRecord::Base
  attr_accessible :conteudo, :respostas_attributes
  
  belongs_to :quiz
  has_many :respostas
  
  validates_presence_of :quiz_id
  validates_associated :quiz
  
  accepts_nested_attributes_for :respostas, allow_destroy: true
end
