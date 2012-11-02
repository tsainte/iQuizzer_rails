class CreateRespostas < ActiveRecord::Migration
  def change
    create_table :respostas do |t|
      t.string :conteudo
      t.boolean :correta

      t.timestamps
    end
  end
end
