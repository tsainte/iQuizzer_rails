class AddColumnSenhaUsuario < ActiveRecord::Migration
  def up
    add_column :usuarios, :senha, :string
  end


  def down
  end
end
