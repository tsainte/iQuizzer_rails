class AddColumnUsuarioIdJogo < ActiveRecord::Migration
  def up
        add_column :jogos, :usuario_id, :integer
  end

  def down
  end
end
