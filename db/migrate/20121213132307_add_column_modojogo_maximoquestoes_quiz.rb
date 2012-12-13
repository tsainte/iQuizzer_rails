class AddColumnModojogoMaximoquestoesQuiz < ActiveRecord::Migration
  def up
      add_column :quizzes, :modojogo, :integer
      add_column :quizzes, :maxquestoes, :integer
  end

  def down
  end
end
