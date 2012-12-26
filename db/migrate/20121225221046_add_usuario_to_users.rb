class AddUsuarioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :text
    add_column :users, :scoreplayer, :integer
    add_column :users, :scorecreator, :integer
    add_column :users, :firstname, :text
    add_column :users, :lastname, :text
  end
end
