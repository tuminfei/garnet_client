require 'fileutils'

namespace :garnet_client do
  namespace :init do
    desc "Generate garnet_client init file from example"
    task :create do
      source = File.join(Gem.loaded_specs["geee_pay"].full_gem_path, "garnet_client.rb")
      target = File.join(Rails.root, "config", "initializers", "garnet_client.rb")
      FileUtils.cp_r source, target
    end

  end
end