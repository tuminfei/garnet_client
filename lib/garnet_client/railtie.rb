#encoding: utf-8
module GarnetClient
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'rake/garnet_client.rake'
    end
  end
end