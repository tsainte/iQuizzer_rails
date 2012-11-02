class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :sobrenome
      t.string :apelido
      t.float :pontos_criador
      t.float :pontos_jogador

      t.timestamps
    end
  end
end
