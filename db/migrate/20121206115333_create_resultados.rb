class CreateResultados < ActiveRecord::Migration
  def change
    drop_table :resultados_pergunta
    create_table :resultados do |t|

      t.timestamps
    end
  end
end
