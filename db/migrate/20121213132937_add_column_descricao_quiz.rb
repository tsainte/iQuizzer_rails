class AddColumnDescricaoQuiz < ActiveRecord::Migration
  def up
      add_column :quizzes, :descricao, :text
  end

  def down
  end
end
