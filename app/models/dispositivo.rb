class Dispositivo < ActiveRecord::Base
  attr_accessible :device_id, :modelo, :versao_app
  belongs_to :user
end
