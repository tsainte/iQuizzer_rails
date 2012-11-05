class CreateRespostas < ActiveRecord::Migration
  def change
    create_table :respostas do |t|
      t.string :conteudo
      t.boolean :correta

      t.integer :pergunta_id
      t.timestamps
    end
  end
end
