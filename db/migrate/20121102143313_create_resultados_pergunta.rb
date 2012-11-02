class CreateResultadosPergunta < ActiveRecord::Migration
  def change
    create_table :resultados_pergunta do |t|
      t.boolean :acertou

      t.timestamps
    end
  end
end
