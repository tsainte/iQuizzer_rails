class AddColumnsResultado < ActiveRecord::Migration
  def up
    add_column :resultados, :resposta_id, :integer
    add_column :resultados, :jogo_id, :integer
  end

  def down
  end
end
