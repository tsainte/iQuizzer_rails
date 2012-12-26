class Jogo < ActiveRecord::Base
  attr_accessible :dia, :hora, :pontos, :resultados_attributes, :usuario_id
  
  has_many :resultados
  belongs_to :user
  accepts_nested_attributes_for :resultados, allow_destroy: true
end
