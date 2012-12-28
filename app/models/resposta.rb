class Resposta < ActiveRecord::Base
  attr_accessible :conteudo, :correta
  
  belongs_to :pergunta
  
  #validates_presence_of :pergunta_id
  #validates_associated :pergunta
end