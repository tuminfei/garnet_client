require 'rails/generators/active_record'

class GarnetClient::MigrationGenerator < ::Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)
  desc 'Installs GarnetClient migration file.'

  def install
    migration_template 'migration.rb', 'db/migrate/create_garnet_client_notices.rb'
  end

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
end