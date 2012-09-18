module Refinery
  module Tranings
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Tranings

      engine_name :refinery_tranings

      initializer "register refinerycms_tranings plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "tranings"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.tranings_admin_tranings_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/tranings/traning'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Tranings)
      end
    end
  end
end
