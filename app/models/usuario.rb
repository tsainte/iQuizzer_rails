class Usuario < ActiveRecord::Base
  attr_accessible :apelido, :nome, :pontos_criador, :pontos_jogador, :sobrenome, :senha
  
  validates_uniqueness_of :apelido #garante que o nome de usuário é único.
  
  has_many :dispositivos
  has_many :jogos
  #has_and_belongs_to_many :quizzes
  has_many :quizzes
end
