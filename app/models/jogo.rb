class Jogo < ActiveRecord::Base
  attr_accessible :dia, :hora, :pontos, :resultados_attributes
  
  has_many :resultados
  belongs_to :usuario
  accepts_nested_attributes_for :resultados, allow_destroy: true
end
