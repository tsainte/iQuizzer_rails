class AddColumnUsuarioIdQuiz < ActiveRecord::Migration
  def up
        add_column :quizzes, :usuario_id, :integer
  end

  def down
  end
end
