class CreateJogos < ActiveRecord::Migration
  def change
    create_table :jogos do |t|
      t.string :dia
      t.string :hora
      t.float :pontos

      t.timestamps
    end
  end
end
