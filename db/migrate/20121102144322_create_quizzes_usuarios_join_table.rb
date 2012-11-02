class CreateQuizzesUsuariosJoinTable < ActiveRecord::Migration
  def up
    create_table :quizzes_usuarios, id: false do |t|
      t.integer :quiz_id
      t.integer :usuario_id
    end
  end

  def down
    drop_table :quizzes_usuarios
  end
end
