class CreateResultadosPergunta < ActiveRecord::Migration
  def change
    drop_table :resultados_pergunta
    create_table :resultados_pergunta do |t|

      t.timestamps
      
    end
  end
end
