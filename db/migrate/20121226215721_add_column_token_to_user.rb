class AddColumnTokenToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
     # t.token_authenticatable
     add_column :users, :token_authenticatable, :string
    end
  end
  def self.down
    t.remove :authentication_token
  end
end
