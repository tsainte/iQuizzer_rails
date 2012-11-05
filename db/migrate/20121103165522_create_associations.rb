class CreateAssociations < ActiveRecord::Migration
  def up
    add_column :perguntas, :quiz_id, :integer
    add_column :respostas, :pergunta_id, :integer
    
    add_column :dispositivos, :usuario_id, :integer
  end

  def down
  end
end
