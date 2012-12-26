class RenaneUsuarioIDtoUserId < ActiveRecord::Migration
  def up
    rename_column :quizzes, :usuario_id, :user_id
    rename_column :jogos, :usuario_id, :user_id
    rename_column :dispositivos, :usuario_id, :user_id
  end

  def down
  end
end
