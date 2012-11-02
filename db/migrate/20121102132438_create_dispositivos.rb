class CreateDispositivos < ActiveRecord::Migration
  def change
    create_table :dispositivos do |t|
      t.string :modelo
      t.string :versao_app
      t.string :device_id

      t.timestamps
    end
  end
end
