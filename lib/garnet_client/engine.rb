module GarnetClient
  class Engine < ::Rails::Engine
    isolate_namespace GarnetClient

    initializer 'GarnetClient', group: :all do |app|
      Rails.application.routes.prepend do
        mount GarnetClient::Engine, at: '/api/garnet_client'
      end
    end
  end
end