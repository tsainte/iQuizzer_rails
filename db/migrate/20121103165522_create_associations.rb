class CreateAssociations < ActiveRecord::Migration
  def up
    add_column :perguntas, :quiz_id, :integer
    add_column :respostas, :pergunta_id, :integer
    
    add_column :dispositivos, :usuario_id, :integer
    
    add_column :resultados_pergunta, :resposta_id, :integer
    add_column :resultados_pergunta, :jogo_id, :integer
  end

  def down
  end
end
