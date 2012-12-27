class AddIndexAuthUser < ActiveRecord::Migration

    def change
      add_column :users, :authentication_token, :string
      add_index :users, :authentication_token, :unique => true
      remove_column :users, :authentication_token

    end
    
  end


