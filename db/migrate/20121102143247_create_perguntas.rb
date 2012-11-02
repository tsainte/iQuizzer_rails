class CreatePerguntas < ActiveRecord::Migration
  def change
    create_table :perguntas do |t|
      t.string :conteudo

      t.timestamps
    end
  end
end
