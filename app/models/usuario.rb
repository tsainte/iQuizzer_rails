class Usuario < ActiveRecord::Base
  attr_accessible :apelido, :nome, :pontos_criador, :pontos_jogador, :sobrenome
  
  has_many :dispositivos
  has_and_belongs_to_many :quizzes
end
