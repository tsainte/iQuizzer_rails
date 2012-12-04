class ResultadoPergunta < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :resposta
  belongs_to :jogo
end
