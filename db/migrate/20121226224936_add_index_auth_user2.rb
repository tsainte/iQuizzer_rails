class AddIndexAuthUser2 < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string
    add_index :users, :authentication_token, :unique => true
    remove_column :users, :token_authenticatable
  end
end
