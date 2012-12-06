class Resultado < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :resposta_id, :resposta_conteudo, :pergunta_conteudo
  
  has_one :resposta
  validates_associated :resposta
  belongs_to :jogo
end
