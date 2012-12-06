class AddMoreColumnsResultado < ActiveRecord::Migration
  def up
        add_column :resultados, :pergunta_conteudo, :string
        add_column :resultados, :resposta_conteudo, :string
  end

  def down
  end
end
