class AddColumnToResultadoPergunta < ActiveRecord::Migration
  def change
    add_column :resultados_pergunta, :resposta_id, :integer
    add_column :resultados_pergunta, :jogo_id, :integer
  end
end
