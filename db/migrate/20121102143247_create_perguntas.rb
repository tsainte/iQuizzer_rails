class CreatePerguntas < ActiveRecord::Migration
  def change
    create_table :perguntas do |t|
      t.string :conteudo

      t.integer :quiz_id
      t.timestamps
    end
  end
end
